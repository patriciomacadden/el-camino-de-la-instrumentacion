# Presentation Builder

A simple tool to create presentations from Markdown files with HTML templates.

## Get Started

### Download and Setup
1. Download this repository as ZIP or clone it
2. Create your slides in the `slides/` directory (see examples below)
3. Run `ruby build` to generate HTML files
4. Open `output/1.html` in your browser

### Deploy to GitHub Pages
The tool has a github action configured to deploy the output dir to a github pages.

1. enable github pages in the repo
2. and `git push`

The presentation will be available at `https://yourusername.github.io/your-repo-name/1.html`

## Usage

### Build Command
```bash
ruby build
```
This command:
- Watches for file changes
- Starts a local development server
- Rebuilds slides automatically
- Serves your presentation at `http://localhost:8000`

- **Local development**: Open `http://localhost:8000` after running `ruby build`

## Creating Slides

Write Markdown files in `slides/` directory with YAML frontmatter:

The variables supported in the frontmatter are:

#REVIEW: complete the list of available variables

### Available Templates
- `frontpage` - Hero/welcome slides
- `section-title` - Chapter dividers
- `content` - Main content slides

### Images and Media
- Place files in `slides/media` directory
- Reference as `![Alt text](media/filename.png)` in Markdown
- **Always use `media/filename` path format** (the build moves the files and sets the paths automatically)

## Examples

See the example slides in `slides/` directory for for explanations and more details

Run `ruby build` to see the examples in action.
