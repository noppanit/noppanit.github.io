# Claude Assistant Guide for noppanit.github.io

This file helps Claude understand the repository structure and common tasks for this Jekyll blog.

## Repository Overview

This is a personal blog built with **Jekyll 4.3** and deployed to **GitHub Pages** via **GitHub Actions**. It was migrated from Octopress to pure Jekyll in December 2024/January 2025.

**Live Site**: https://www.noppanit.com
**Repository**: https://github.com/noppanit/noppanit.github.io

## Branch Structure

- `source` - Main development branch (contains source code)
- `master` - Deployment branch (auto-updated by GitHub Actions with built site)

**Important**: All development happens on the `source` branch.

## Tech Stack

- **Jekyll**: 4.3.x (static site generator)
- **Ruby**: 3.3.6 (managed via rbenv)
- **Markdown**: Kramdown
- **Plugins**: jekyll-feed
- **Deployment**: GitHub Actions (`.github/workflows/jekyll.yml`)

## Project Structure

```
.
├── _config.yml           # Jekyll configuration
├── _includes/            # Reusable HTML components (head.html, pagination.html, etc.)
├── _layouts/             # Page templates (default.html)
├── _posts/               # Blog posts (Markdown files)
│   └── YYYY-MM-DD-title.md
├── _site/                # Generated site (gitignored, do not commit)
├── images/               # Site images
├── stylesheets/          # CSS files (style.css, syntax.css)
├── wp-content/uploads/   # Legacy WordPress uploads
├── .github/workflows/    # GitHub Actions workflows
├── Gemfile               # Ruby dependencies
├── README.md             # User-facing documentation
└── CLAUDE.md             # This file
```

## Common Tasks

### Creating a New Blog Post

1. Create a file in `_posts/` with format: `YYYY-MM-DD-title.md`
2. Use this frontmatter template:

```yaml
---
title: Your Post Title
comments: true
author: Noppanit Charassinvichai
categories:
  - Category Name
tags:
  - tag1
  - tag2
---

Your post content here...
```

3. Write content in Markdown
4. Preview locally: `bundle exec jekyll serve`
5. Commit and push to `source` branch

### Building the Site Locally

```bash
# Build once
bundle exec jekyll build

# Serve with auto-rebuild
bundle exec jekyll serve

# Serve with live reload
bundle exec jekyll serve --livereload
```

The site will be available at http://127.0.0.1:4000

### Running Commands

**IMPORTANT**: Always use rbenv-managed Ruby:

```bash
# Initialize rbenv (if not already in shell)
eval "$(/opt/homebrew/bin/rbenv init - zsh)"

# Then run commands
bundle exec jekyll serve
```

### Deploying to Production

Simply push to the `source` branch:

```bash
git add .
git commit -m "Your commit message"
git push origin source
```

GitHub Actions will automatically build and deploy to GitHub Pages.

## Important Files

### `_config.yml`
Site-wide configuration including:
- Site metadata (title, description, URL)
- Build settings (markdown processor, plugins)
- Permalinks structure
- Excluded files/directories

### `Gemfile`
Ruby dependencies. Key gems:
- `jekyll ~> 4.3` - Static site generator
- `jekyll-feed ~> 0.17` - RSS feed generation
- `webrick ~> 1.8` - Development server (required for Ruby 3.x)

### `.github/workflows/jekyll.yml`
GitHub Actions workflow that:
1. Checks out the `source` branch
2. Sets up Ruby 3.3.6
3. Installs dependencies
4. Builds the site with Jekyll
5. Deploys to GitHub Pages

## What NOT to Do

1. **Never commit `_site/` directory** - It's generated and gitignored
2. **Never work on `master` branch** - It's auto-updated by GitHub Actions
3. **Never use system Ruby** - Always use rbenv (Ruby 3.3.6)
4. **Never commit `Gemfile.lock`** - It's gitignored to avoid conflicts

## Migration Notes (Historical Context)

This blog was migrated from Octopress to pure Jekyll in December 2024. Changes made:

1. **Removed Octopress dependencies**:
   - Removed `octopress` gem
   - Removed `octopress-codeblock` gem
   - Removed `octopress-image-tag` gem

2. **Converted Octopress syntax**:
   - `{% img URL %}` → `<img src="URL" />`
   - `{% codeblock lang %}` → ` ```lang `

3. **Upgraded Jekyll**: 3.6.2 → 4.3.x

4. **Removed legacy files**:
   - `.themes/` directory
   - `_templates/` directory
   - `_deploy.yml`

## Troubleshooting

### Bundler Version Error
```bash
# Initialize rbenv first
eval "$(/opt/homebrew/bin/rbenv init - zsh)"

# Or open a new terminal window
```

### Port Already in Use
```bash
bundle exec jekyll serve --port 4001
```

### Clean Build
```bash
bundle exec jekyll clean
bundle exec jekyll build
```

### Update Dependencies
```bash
bundle update
```

## Image Handling

Images are stored in multiple locations:
- `images/` - New site images
- `wp-content/uploads/` - Legacy WordPress uploads (organized by year/month)

When referencing images in posts, use absolute paths from root:
```markdown
![Alt text](/images/image.png)
<img src="/wp-content/uploads/2015/07/screenshot.jpg" alt="Description" />
```

## Code Blocks

Use standard Markdown fenced code blocks with language hints:

````markdown
```python
def hello():
    print("Hello, world!")
```
````

## RSS Feed

Automatically generated by `jekyll-feed` plugin at `/feed.xml`

## GitHub Pages Compatibility

This site uses modern Jekyll 4.3, which requires GitHub Actions for deployment. GitHub Pages' built-in Jekyll is version 3.9.x and won't work with this configuration.

**Deployment Method**: GitHub Actions (not GitHub Pages built-in Jekyll)

## Testing Checklist

Before pushing changes:

1. ✅ Build succeeds: `bundle exec jekyll build`
2. ✅ Site runs locally: `bundle exec jekyll serve`
3. ✅ New posts render correctly
4. ✅ Links work
5. ✅ Images load
6. ✅ No Liquid syntax errors

## Quick Reference Commands

```bash
# Preview site locally
bundle exec jekyll serve

# Build site
bundle exec jekyll build

# Clean build cache
bundle exec jekyll clean

# Install dependencies
bundle install

# Update dependencies
bundle update

# Check Ruby version
ruby --version  # Should show 3.3.6

# Check bundler version
bundle --version  # Should show 4.x
```

## Contact & Metadata

- **Author**: Noppanit Charassinvichai
- **Email**: hi@noppanit.com
- **Twitter**: @noppanit
- **GitHub**: @noppanit

## Additional Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [Kramdown Syntax](https://kramdown.gettalong.org/syntax.html)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [rbenv Documentation](https://github.com/rbenv/rbenv)

---

**Last Updated**: January 2025
**Claude**: When you see this file, you now understand the context of this repository. Use this information to help with tasks efficiently and accurately.