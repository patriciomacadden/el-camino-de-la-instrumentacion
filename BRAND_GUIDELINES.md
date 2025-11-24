# SINAPTIA Brand Guidelines

## Table of Contents
1. [Brand Overview](#brand-overview)
2. [Color Palette](#color-palette)
3. [Typography](#typography)
4. [Logo](#logo)
5. [Layout & Spacing](#layout--spacing)
6. [UI Components](#ui-components)
7. [Visual Effects](#visual-effects)
8. [Content Guidelines](#content-guidelines)

---

## Brand Overview

SINAPTIA is a software development company specializing in Ruby on Rails, React, and intelligent applications. The brand identity reflects technical expertise, innovation, and modern design sensibilities.

**Brand Values:**
- Technical Excellence
- Innovation
- Clarity
- Professionalism

---

## Color Palette

### Primary Colors

#### Accent Blue
- **Primary Blue**: `#55adff`
  - Usage: Links, hover states, interactive elements
  - CSS Variable: `--color-sinaptia-accent-blue`

- **Active Blue**: `#448acc`
  - Usage: Active states, pressed buttons
  - CSS Variable: `--color-sinaptia-accent-blue-active`

#### Accent Green
- **Green (Over White)**: `#55ffcc`
  - Usage: Links on white backgrounds, accent elements
  - CSS Variable: `--color-sinaptia-accent-green-over-white`

- **Green (Over Black)**: `#7fe2c5`
  - Usage: Links on dark backgrounds, code strings, gradients
  - CSS Variable: `--color-sinaptia-accent-green-over-black`

### Neutral Colors

#### Grays
- **Light Gray**: `#d6dad9`
  - Usage: Borders, dividers on black backgrounds
  - CSS Variable: `--color-sinaptia-gray-light`

- **Mid Gray**: `#b2b6b5`
  - Usage: Secondary text, subtle elements
  - CSS Variable: `--color-sinaptia-gray-mid`

- **Dark Gray**: `#999e9d`
  - Usage: Muted text, disabled states
  - CSS Variable: `--color-sinaptia-gray-dark`

#### Base Colors
- **SINAPTIA White**: `#fbfbfb`
  - Usage: Text on dark backgrounds, light page backgrounds
  - CSS Variable: `--color-sinaptia-white`

- **Black**: `#000000`
  - Usage: Primary backgrounds, text on light backgrounds

### Logo Colors
- **Logo Green**: `#00B7A1` (`.st0` class in SVG)
- **Logo Gray**: `#808184` (`.st1` class in SVG)

### Color Usage Guidelines

**Background Variants:**
The site uses three primary background variants:
1. **White Variant**: White background with black text
2. **Black Variant**: Black background with white text
3. **Blue Variant**: Active blue background with white text

**Accessibility:**
- Ensure sufficient contrast ratios (minimum 4.5:1 for normal text)
- Use appropriate green variants based on background color
- Test interactive elements for color blindness accessibility

---

## Typography

### Font Families

#### Sans Serif (Body)
- **Font**: Inter
- **Fallback**: ui-sans-serif
- **CSS Variable**: `--font-sans`
- **Usage**: Body text, paragraphs, general content
- **Weights Available**: 100-900
- **Source**: Google Fonts

#### Monospace (Lead/UI)
- **Font**: Inconsolata
- **CSS Variable**: `--font-lead`
- **Usage**: Navigation, labels, tags, metadata, inline code
- **Weights Available**: 200-900
- **Source**: Google Fonts
- **Style**: Bold, uppercase for UI elements

#### Display (Titles)
- **Font**: PP Monument Extended
- **CSS Variable**: `--font-title`
- **Usage**: Headings, large titles, hero text
- **Weight**: Regular
- **Source**: Custom font (`/assets/fonts/PPMonumentExtended-Regular.otf`)
- **Style**: Uppercase, extended letterforms

### Typography Scale

#### Headers
- **H1**:
  - Desktop: `56px` (uppercase, font-title)
  - Mobile: `32px` (uppercase, font-title)
  - Leading: none

- **H2**:
  - Desktop: `32px` (uppercase, font-title)
  - Mobile: `22px` (uppercase, font-title)
  - Leading: none
  - Padding bottom: `16px`

- **H3**:
  - Size: `24px` (1.5rem)
  - Color: Accent Blue
  - Style: Bold, uppercase, font-lead
  - Padding bottom: `16px`

- **H4**:
  - Size: `20px` (1.25rem)
  - Style: Bold, uppercase, font-lead
  - Padding bottom: `16px`

#### Body Text
- **Size**: `18px` (1.125rem)
- **Weight**: 300 (light) for reading content
- **Leading**: tight to normal depending on context

#### UI Text
- **Size**: `18px` for navigation and buttons
- **Style**: Bold, uppercase, font-lead
- **Usage**: Navigation links, buttons, labels

### Text Styling Guidelines

- **Uppercase Usage**: Navigation, titles, labels, and headings
- **Link Styling**:
  - Posts/Content: Green with underline, remove underline on hover
  - Navigation: Blue on hover, Active Blue when active
- **Code Styling**:
  - Inline: Bold, Accent Blue, font-lead
  - Blocks: Dark background (`#161617`) with syntax highlighting

---

## Logo

### Logo Specifications

The SINAPTIA logo consists of:
1. **Icon Mark**: Teal/green person symbol representing neural connections
2. **Wordmark**: Gray "SINAPTIA" text in sans-serif font

**File Location**: `/assets/images/logo.svg`

### Logo Dimensions
- **Height**: `28px` (1.75rem / `h-7`)
- **Width**: `176px` (11rem / `w-44`)

### Logo Colors
- **Icon**: `#00B7A1` (teal green)
- **Text**: `#808184` (gray)

### Logo Usage
- Primary placement: Top left of navigation
- Must maintain aspect ratio
- Minimum clear space: Equal to the height of the icon mark
- Do not alter colors or proportions
- Ensure adequate contrast with background

### Variations
The logo appears to be designed for light backgrounds. For dark backgrounds, ensure the SVG classes maintain visibility.

---

## Layout & Spacing

### Container Widths
- **Mobile**: `16px` padding (px-4)
- **Desktop**: `64px` padding (px-16 / md:px-16)
- **XL Desktop**: `148px` padding (xl:px-[148px])
- **2XL Desktop**: `256px` padding (2xl:px-64)

### Vertical Spacing
- **Standard Section**: `80px` top padding (pt-20)
- **XL Section**: `120px` top padding (xl:pt-[120px])
- **Content Spacing**: `16px` between elements (space-y-4)
- **Large Gaps**: `176px` between major sections (xl:space-x-44)

### Grid System
- Uses Tailwind's flexbox utilities
- Responsive breakpoints:
  - Mobile first
  - `md:` Medium screens
  - `xl:` Extra large screens
  - `2xl:` 2X large screens

---

## UI Components

### Navigation

**Desktop Navigation:**
- Fixed position at top
- Background adapts to page variant
- Font: Inconsolata, bold, uppercase, 18px
- Links: 32px spacing between items
- Hover: Changes to Accent Blue
- Active: Uses Accent Blue Active

**Mobile Navigation:**
- Hamburger menu (6-bar width)
- Uses `tham-e-squeeze` animation
- Opens overlay menu

### Buttons & Links

**Primary CTA:**
- Black background on white pages / White background on black pages
- Bold, uppercase text (font-lead)
- Hover effect: Accent Blue glow (blur-[256px])
- Padding: `18px` vertical, `24px` horizontal

**Link Buttons:**
- Border style with hover states
- Arrow icon (`arrow-up-right` from Lucide)
- Icon scales 1.25x and turns blue on hover
- Duration: 500ms ease-in-out

**Tag/Category Links:**
- White border
- Uppercase, font-lead
- Padding: `12px` vertical, `16px` horizontal
- Hover: Blue background
- Active: Active Blue background

### Cards & Containers

**Service Cards:**
- Border with brand color
- Relative positioning for effects
- Overflow hidden for blur effects
- Group hover interactions

**Post Content:**
- White text on black background
- Syntax highlighted code blocks
- Responsive image sizing
- Generous line height for readability

### Icons
- **Library**: Lucide Icons
- **CDN**: `unpkg.com/lucide@latest`
- **Usage**: Arrow icons, UI elements
- **Style**: Minimal, consistent stroke width

---

## Visual Effects

### Gradients

**Animated Text Gradient:**
```css
background: linear-to-r from-sinaptia-accent-blue via-white to-sinaptia-accent-green-over-black
background-size: 400%
animation: animatedgradient 6s ease infinite alternate
```

Used on large SINAPTIA text in footer.

**Gradient Animation:**
- Duration: 6 seconds
- Easing: ease
- Loop: infinite alternate
- Position shift: 0% to 100%

### Blur Effects

**Accent Glow:**
- Size: `256px` or `384px` blur
- Color: Accent Blue (`bg-sinaptia-accent-blue`)
- Usage: Hover states on service cards, decorative accents
- Implementation: Absolute positioned element with `blur-[]` utility

**Decorative Blur:**
- Size: `144px` blur
- Color: Accent Green
- Usage: Page accents, visual interest
- Position: Strategic placement for visual balance

### Hover States

**Link Hover:**
- Icon: Scale 1.25x + color change to blue
- Transition: 500ms ease-in-out
- Text underline: Remove on hover (content links)

**Card Hover:**
- Reveal blur effect
- Smooth transitions

### Animations

**Marquee:**
```css
animation: marquee 2s linear infinite
transform: translateX(0) to translateX(calc(-100% - var(--gap)))
```

**Header (Headroom.js):**
- Fixed navigation that responds to scroll
- Hides on scroll down, shows on scroll up

---

## Content Guidelines

### Writing Style

**Voice:**
- Professional but approachable
- Technical but clear
- Confident and expert

**Tone:**
- Direct and concise
- Educational when explaining concepts
- Action-oriented for CTAs

### Text Formatting

**Headings:**
- Always uppercase
- Keep concise
- Use hierarchy (H1 → H2 → H3)

**Body Text:**
- Sentence case
- Clear paragraphs with spacing
- Use lists for scannable content

**Code:**
- Inline code: Use sparingly, highlight keywords
- Code blocks: Include language specification for proper syntax highlighting
- Comments: Explain complex logic

### Content Types

**Blog Posts:**
- Excerpt: 1-2 sentences summarizing the post
- Tags: 2-5 relevant tags
- Date: Ordinal US format (e.g., "January 1st, 2025")
- Authors: Listed by name

**Case Studies:**
- Custom ordering via `order` field
- Detailed client work
- Results-focused narrative

---

## Technical Implementation Notes

### CSS Architecture
- **Framework**: TailwindCSS v4.0
- **Plugin**: jekyll-tailwind
- **Custom Theme**: Defined in `@theme` block
- **Layers**: Base, components, utilities

### Font Loading
- **Strategy**: `font-display: swap` for custom fonts
- **Preconnect**: Google Fonts domains for performance
- **Fallbacks**: System fonts for each category

### Responsive Design
- **Approach**: Mobile-first
- **Breakpoints**: Follow Tailwind defaults
- **Images**: WebP format for optimization
- **Assets**: Lazy loading where appropriate

### Accessibility
- **Semantic HTML**: Proper heading hierarchy
- **ARIA Labels**: On interactive elements (menu buttons, logos)
- **Focus States**: Visible and consistent
- **Color Contrast**: WCAG AA compliant

---

## Resources

### Design Files
- Logo: `/assets/images/logo.svg`
- Fonts: `/assets/fonts/PPMonumentExtended-Regular.otf`
- Splash: `/assets/images/splash.webp`

### CSS Files
- Main: `/assets/css/app.css`
- Navigation: `/assets/css/nav.css`
- Posts: `/assets/css/post.css`
- Theme: `/assets/css/sinaptia.css`

### External Resources
- Inter: Google Fonts
- Inconsolata: Google Fonts
- Icons: Lucide Icons
- Interactions: Alpine.js, HTMX

---

## Version History

- **Version 1.0** (2025-01-21): Initial brand guidelines documentation extracted from codebase

---

For questions or clarification on these guidelines, please refer to the actual implementation in the codebase or contact the design team.
