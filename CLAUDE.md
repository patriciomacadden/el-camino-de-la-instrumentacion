# Sinaptia Slide Builder - Claude Implementation Notes

## Overview
This is a custom slide generation system that separates content (Markdown) from templates (HTML structure), solving the problem of costly template-level changes that previously required manual updates across all slides.

## Architecture

### Key Components
- **Markdown Content**: `slides/*.md` files with YAML frontmatter
- **HTML Templates**: `templates/` directory with shell templates
- **Images**: `slides/` directory for assets (copied to `output/` during build)
- **Output**: `output/` generated HTML slides
- **Builder**: `build` - main processing script

### Template System
- `frontpage` - Hero/title slides
- `section-title` - Chapter dividers
- `content` - Main content slides with text/code/images

## Technical Implementation

### Custom Kramdown Renderer (`SinaptiaRenderer`)
Generates HTML with exact CSS class matches for Sinaptia styling:

```ruby
# Key CSS classes preserved:
- .font-lead (Inconsolata font for headers)
- .text-sinaptia-accent-blue (brand blue)
- .custom-bullets (styled bullet points)
- .text-lg.xl:text-[20px] (responsive typography)
```

### Content Injection Strategy
1. Parse YAML frontmatter from markdown
2. Render markdown content with custom renderer
3. Load appropriate template shell
4. Remove template placeholder content
5. Inject rendered content into template
6. Add syntax highlighting (Prism.js)
7. Fix navigation references

### Image Handling
- Source: `images/whale.png` in markdown (stored in `slides/` directory)
- Generated: `../images/whale.png` in HTML (relative to output dir)
- Assets copied from `slides/` to `output/images/` during build

## Build Process

### Commands
```bash
# Build all slides
ruby build

# Compare with originals
ruby compare_results.rb
```

### Post-Processing Features
- Syntax highlighting via Prism.js CDN
- Navigation script with 3b.html (whale joke slide)
- Clean template content removal
- Proper image path resolution

## File Structure
```
.
├── build               # Main builder script
├── templates/              # HTML template shells
│   ├── frontpage.erb
│   ├── content.erb
│   └── section-title.erb
├── slides/                 # Markdown slides and images
│   ├── 1.md
│   ├── 2.md
│   ├── 3.md
│   ├── 3b.md
│   ├── 4.md
│   ├── 5.md
│   ├── whale.png
│   └── no-moon.png
└── output/                 # Generated slides
    ├── 1.html (frontpage)
    ├── 2.html (section-title)
    ├── 3.html (content)
    ├── 3b.html (whale joke)
    ├── 4.html (content)
    └── 5.html (section-title)
```

## Key Fixes Applied
1. **Template Content Duplication**: Removed placeholder content before injection
2. **Image Paths**: Fixed to use `../images/` from output directory
3. **Code Font Size**: Changed from `text-sm` to `text-base`
4. **Syntax Highlighting**: Added Prism.js CDN integration
5. **Navigation**: Proper 3b.html inclusion for joke effect
6. **CSS Preservation**: Exact match of original Sinaptia styling

## Markdown Format
```yaml
---
template: content
---

# Title Here

Content with **formatting**

```ruby
code blocks with syntax highlighting
```

![Alt text](images/image.png)
```

## Benefits Achieved
- ✅ Template-content separation
- ✅ Single source of truth for templates
- ✅ Easy markdown editing
- ✅ Preserved exact styling
- ✅ Automated build process
- ✅ Working navigation and images

## Usage Notes
- Edit markdown files in `slides/` directory
- Run builder to regenerate all slides
- Template changes apply to all slides automatically
- Images should be placed in `slides/` directory alongside markdown files
- 3b.md is the whale joke slide (intentional)
