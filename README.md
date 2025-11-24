# Presentation Builder

A Ruby-based slide generation system that creates beautiful Sinaptia-branded presentations from Markdown files. Built with Rake, Kramdown, and Tailwind CSS, featuring live development mode with auto-reload.

## Get Started

### Prerequisites
- Ruby 3.4+ (or use Docker)
- Bundler gem
- Tailwind CSS standalone CLI (or use Docker)

### Local Setup
```bash
# Install dependencies
bundle install

# Build and start development server
rake server

# Open in browser
open http://localhost:8000
```

### Docker Setup
```bash
# Start containerized development environment
docker-compose up

# Open in browser
open http://localhost:8000
```

### Deploy to GitHub Pages
The repository includes a GitHub Action that automatically deploys the `output/` directory to GitHub Pages.

**Setup steps:**
1. Enable GitHub Pages in repository settings
2. Push changes: `git push`
3. Access at: `https://yourusername.github.io/your-repo-name/`

The first slide is served as `index.html` for easy access.

## Usage

### Rake Tasks
```bash
# Build slides once (for production)
rake build

# Build + start development server with auto-reload
rake server
```

### Development Mode (`rake server`)
When you run `rake server`, the system:
- **Builds all slides** from `slides/*.md` files
- **Compiles Tailwind CSS** from `assets/application.css`
- **Starts local server** at `http://localhost:8000`
- **Watches for changes** in `slides/`, `templates/`, and `assets/`
- **Auto-rebuilds** when files are modified

**Smart rebuilding:**
- CSS changes → Recompiles styles only
- Markdown/template changes → Full rebuild

## Creating Slides

### File Structure
Create numbered Markdown files in the `slides/` directory:
```
slides/
├── 01.md    # Becomes index.html
├── 02.md    # Becomes 02.html
├── 03.md    # Becomes 03.html
└── ...
```

### Slide Format
Each slide is a Markdown file with optional YAML frontmatter:

```yaml
---
mode: light        # "light" or "dark" (default: light)
variant: center    # "top" or "center" (default: top)
logo: full         # "full", "square", or omit (default: no logo)
---

# Your Slide Title

Your content here with **markdown** formatting.

```ruby
# Code blocks with syntax highlighting
def hello
  puts "Hello, World!"
end
```
```

### Frontmatter Options

| Option | Values | Default | Description |
|--------|--------|---------|-------------|
| `mode` | `light`, `dark` | `light` | Background and text color scheme |
| `variant` | `top`, `center` | `top` | Vertical content alignment |
| `logo` | `full`, `square`, (none) | (none) | Sinaptia logo in footer |

**Examples:**
- Title slide: `variant: center` with `logo: full`
- Content slide: `variant: top` (default)
- Dark mode: `mode: dark`

## Markdown Features

This system uses **GitHub Flavored Markdown (GFM)** with full support for:

- **Headings**: `# H1`, `## H2`, `### H3`, etc.
- **Text formatting**: **bold**, *italic*, `inline code`
- **Lists**: Ordered and unordered lists with nesting
- **Links**: `[Link text](https://example.com)`
- **Code blocks**: Fenced code blocks with syntax highlighting
  ```ruby
  def example
    puts "Syntax highlighting works!"
  end
  ```
- **Tables**: Full GFM table support
- **Blockquotes**: Using `>` prefix
- **Task lists**: `- [ ]` and `- [x]` checkboxes
- **Strikethrough**: `~~strikethrough~~`

### Syntax Highlighting
Code blocks automatically get syntax highlighting via **Rouge**. Just specify the language:

````markdown
```ruby
def hello
  puts "Hello, World!"
end
```
````

## Navigation

**Keyboard controls:**
- **Right/Down Arrow**: Next slide
- **Left/Up Arrow**: Previous slide

Navigation is automatically configured based on slide order in the `slides/` directory.

## Examples

The repository includes example slides (`slides/01.md` through `slides/18.md`) demonstrating:
- Title slides with centered content
- Content slides with top alignment
- Dark mode slides
- Logo usage (full and square variants)
- Code blocks with syntax highlighting
- Various markdown features

**To view examples:**
```bash
rake server
# Open http://localhost:8000
```

## Customization

### Brand Guidelines
The system applies Sinaptia brand styling automatically. For details on colors, fonts, and design patterns, see `BRAND_GUIDELINES.md`.

**Key brand elements:**
- **Colors**: Sinaptia Accent Blue (#55adff), Accent Green (#55ffcc/#7fe2c5)
- **Fonts**:
  - PP Monument Extended (titles)
  - Inconsolata (headings, UI)
  - Inter (body text)
- **Styling**: Tailwind CSS with custom Sinaptia theme

### Modifying Styles
1. **Edit CSS**: Modify `assets/application.css` (Tailwind CSS source)
2. **Auto-recompile**: Changes detected automatically in development mode
3. **Custom styles**: Add to `assets/sinaptia.css` for brand-specific styling

### Template Customization
The single template file is located at `templates/layout.html.erb`. Modifications apply to all slides automatically.

## Troubleshooting

### Build Issues
- **Missing dependencies**: Run `bundle install`
- **Tailwind CSS not found**: Install [Tailwind CSS standalone CLI](https://tailwindcss.com/blog/standalone-cli)
- **Port 8000 in use**: Kill existing process or modify port in `rakefile`

### Docker Issues
- **Build fails**: Run `docker-compose build --no-cache`
- **Changes not reflecting**: Volume mounts should be automatic; restart container if needed

## Project Structure

```
.
├── rakefile                 # Build tasks and dev server
├── Gemfile                  # Ruby dependencies
├── Dockerfile               # Container image
├── docker-compose.yml       # Docker Compose config
├── templates/
│   └── layout.html.erb     # Single unified template
├── assets/
│   ├── application.css     # Tailwind CSS source
│   ├── sinaptia.css        # Brand styles
│   ├── logo.svg            # Sinaptia logos
│   ├── logo-square.svg
│   └── PPMonumentExtended-Regular.otf
├── slides/                 # Your markdown slides
│   ├── 01.md
│   ├── 02.md
│   └── ...
└── output/                 # Generated HTML (git-ignored)
    ├── index.html
    ├── 02.html
    ├── ...
    └── application.css
```

## Tech Stack

- **Ruby 3.4+**: Build system and templating
- **Rake**: Task automation
- **Kramdown**: Markdown parsing with GFM support
- **Rouge**: Syntax highlighting
- **ERB**: Template rendering
- **Tailwind CSS**: Utility-first styling
- **WEBrick**: Development server
- **Listen**: File watching for auto-rebuild

## Contributing

For implementation details and technical notes, see `CLAUDE.md`.

## License

[Add your license information here]
