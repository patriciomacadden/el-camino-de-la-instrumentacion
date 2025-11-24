# Sinaptia Slide Builder - Claude Implementation Notes

## Overview
This is a custom slide generation system built with Ruby, Rake, and ERB that creates beautiful Sinaptia-branded presentations from Markdown files. The system provides a unified template with flexible configuration options through YAML frontmatter, supporting light/dark modes, centered/top layouts, and optional logo placement.

## Architecture

### Key Components
- **Markdown Content**: `slides/*.md` files with YAML frontmatter for configuration
- **Single HTML Template**: `templates/layout.html.erb` - unified template for all slides
- **Assets**: `assets/` directory containing CSS, fonts, and logo files
- **Output**: `output/` generated HTML slides with compiled CSS
- **Builder**: `rakefile` - Rake tasks for building, watching, and serving
- **Development Server**: Built-in WEBrick server with hot-reload on port 8000
- **Docker Support**: Dockerfile and docker-compose.yml for containerized development

### Template System (Simplified)
The system now uses a **single unified template** (`layout.html.erb`) instead of multiple template types. Slide appearance is controlled via frontmatter options:
- **mode**: `light` (default) or `dark` - controls background and text colors
- **variant**: `top` (default) or `center` - controls vertical content alignment
- **logo**: `full`, `square`, or omit - controls footer logo display

## Technical Implementation

### Markdown Processing
Uses **Kramdown** with GitHub Flavored Markdown (GFM) and **Rouge** for syntax highlighting:
- Input format: GFM (GitHub Flavored Markdown)
- Syntax highlighter: Rouge with `.highlight` CSS class
- Converts markdown to HTML while preserving code blocks and formatting

### Build Pipeline
1. **Parse frontmatter** - Extract YAML configuration (mode, variant, logo)
2. **Render markdown** - Convert markdown content to HTML with Kramdown
3. **Compile CSS** - Run Tailwind CSS on `assets/application.css` → `output/application.css`
4. **Copy assets** - Copy fonts, logos, and brand assets to output directory
5. **Template rendering** - Inject content and configuration into ERB template
6. **Generate navigation** - Create slide navigation array for keyboard controls
7. **Write HTML files** - First slide becomes `index.html`, others numbered by filename

### Asset Pipeline
- **CSS Compilation**: Tailwind CSS processes `assets/application.css` with `--minify` flag
- **Font Handling**: `PPMonumentExtended-Regular.otf` copied to output directory
- **Logo Files**: Both `logo.svg` and `logo-square.svg` copied to output
- **Cache Busting**: CSS includes timestamp query parameter (`?v=<timestamp>`)

### Navigation System
- **Keyboard Controls**: Arrow keys (left/right, up/down) for navigation
- **Slide Array**: Generated at build time, injected into each page via JavaScript
- **File Naming**:
  - First slide: `index.html`
  - Subsequent slides: `{filename}.html` (e.g., `02.html`, `10.html`)
- **Auto-detection**: JavaScript detects current slide and enables prev/next navigation

## Build Process

### Rake Tasks
```bash
# Build slides once
rake build

# Build and start development server with file watching
rake server

# Docker commands
docker-compose up        # Start containerized development environment
docker-compose build     # Rebuild Docker image
```

### Development Workflow
1. **Edit slides** - Modify `.md` files in `slides/` directory
2. **Auto-rebuild** - File watcher detects changes and rebuilds automatically
3. **Live preview** - Browser at `http://localhost:8000` shows updates
4. **Asset watching** - CSS changes trigger style recompilation only
5. **Content watching** - Markdown/template changes trigger full rebuild

### File Watching
The development server monitors three directories:
- `slides/` - Markdown content files
- `templates/` - ERB template files
- `assets/` - CSS, fonts, and images

**Smart rebuilding:**
- CSS file changes → `compile_css` only
- Everything else → Full `run_build`

## File Structure
```
.
├── rakefile                    # Rake tasks for build, server, and file watching
├── Gemfile                     # Ruby dependencies (kramdown, listen, webrick, etc.)
├── Dockerfile                  # Container image for development
├── docker-compose.yml          # Docker Compose configuration
├── .dockerignore               # Docker build exclusions
├── .gitignore                  # Git exclusions (output/ directory)
├── BRAND_GUIDELINES.md         # Sinaptia brand colors, fonts, and styling
├── README.md                   # User-facing documentation
├── CLAUDE.md                   # Implementation notes (this file)
├── templates/
│   └── layout.html.erb        # Single unified ERB template
├── assets/
│   ├── application.css        # Tailwind CSS source file
│   ├── sinaptia.css           # Additional Sinaptia styles
│   ├── logo.svg               # Full Sinaptia logo
│   ├── logo-square.svg        # Square logo variant
│   └── PPMonumentExtended-Regular.otf  # Custom title font
├── slides/
│   ├── 01.md                  # First slide (becomes index.html)
│   ├── 02.md                  # Subsequent slides
│   ├── ...
│   └── 18.md
└── output/                    # Generated files (git-ignored)
    ├── index.html             # First slide
    ├── 02.html               # Numbered slides
    ├── ...
    ├── application.css        # Compiled Tailwind CSS
    ├── logo.svg              # Copied assets
    ├── logo-square.svg
    └── PPMonumentExtended-Regular.otf
```

## Key Features
1. **Unified Template**: Single template instead of multiple types (frontpage, content, section-title)
2. **Flexible Configuration**: Control mode (light/dark), layout (top/center), and logo via frontmatter
3. **Live Development**: Auto-rebuild and hot-reload during development
4. **Brand Consistency**: Sinaptia colors, fonts, and styling applied automatically
5. **Smart Asset Pipeline**: Tailwind CSS compilation with cache busting
6. **Docker Support**: Containerized development environment
7. **Keyboard Navigation**: Arrow key navigation between slides
8. **Syntax Highlighting**: Rouge-powered code highlighting in markdown

## Markdown Format

### Basic Structure
```yaml
---
mode: light           # "light" or "dark" (default: light)
variant: center       # "top" or "center" (default: top)
logo: full            # "full", "square", or omit (default: no logo)
---

# Title Here

Content with **formatting** and [links](https://example.com)

## Subheadings

- Bullet points
- More items

```ruby
def hello
  puts "Code blocks with syntax highlighting"
end
```

**Bold**, *italic*, and `inline code`
```

### Frontmatter Options

| Option | Values | Default | Description |
|--------|--------|---------|-------------|
| `mode` | `light`, `dark` | `light` | Background and text color scheme |
| `variant` | `top`, `center` | `top` | Vertical content alignment |
| `logo` | `full`, `square`, (none) | (none) | Footer logo display |

### Markdown Features
- **GitHub Flavored Markdown (GFM)**: Full support for tables, task lists, strikethrough, etc.
- **Syntax Highlighting**: Automatic code highlighting via Rouge
- **Inline HTML**: Can embed HTML when needed
- **Lists**: Ordered, unordered, and nested lists
- **Links and Images**: Standard markdown syntax
- **Code Blocks**: Fenced code blocks with language specification

## Usage Notes
- **File naming**: Use numbered prefixes (01.md, 02.md) for slide ordering
- **First slide**: Becomes `index.html` in output
- **Development**: Use `rake server` for live development with auto-reload
- **Production**: Run `rake build` once to generate static HTML files
- **Styling**: Controlled by Tailwind CSS classes in `assets/application.css`
- **Brand colors**: Defined in `BRAND_GUIDELINES.md` and applied via Sinaptia CSS
