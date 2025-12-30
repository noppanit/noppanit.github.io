# Noppanit's Blog

A personal blog built with Jekyll and hosted on GitHub Pages.

## Prerequisites

- Ruby 3.0 or higher
- Bundler

## Getting Started

### 1. Install Ruby

This project uses Ruby 3.3.6. If you have rbenv installed:

```bash
rbenv install 3.3.6
rbenv local 3.3.6
```

Alternatively, you can use any Ruby version manager (rvm, asdf, etc.) or install Ruby directly.

### 2. Initialize rbenv (Important!)

If using rbenv, you need to initialize it in your shell. Add this to your shell config file:

**For Zsh (.zshrc):**
```bash
eval "$(/opt/homebrew/bin/rbenv init - zsh)"
```

**For Bash (.bashrc or .bash_profile):**
```bash
eval "$(rbenv init - bash)"
```

Then reload your shell:
```bash
source ~/.zshrc  # or source ~/.bashrc
```

Or simply open a new terminal window.

### 3. Verify Ruby Version

```bash
ruby --version
# Should show: ruby 3.3.6
```

### 4. Install Dependencies

```bash
gem install bundler
bundle install
```

**Note:** If you get a Bundler version error, make sure rbenv is properly initialized (see step 2).

### 5. Build the Site

To build the site:

```bash
bundle exec jekyll build
```

The site will be generated in the `_site` directory.

### 6. Run Development Server

To run a local development server:

```bash
bundle exec jekyll serve
```

Then visit http://127.0.0.1:4000 in your browser.

The server will automatically rebuild the site when you make changes to files.

### 7. Run with Live Reload

For automatic browser refresh on changes:

```bash
bundle exec jekyll serve --livereload
```

## Project Structure

```
.
├── _config.yml          # Jekyll configuration
├── _includes/           # Reusable HTML components
├── _layouts/            # Page templates
├── _posts/              # Blog posts (Markdown)
├── _site/               # Generated site (do not edit)
├── images/              # Site images
├── stylesheets/         # CSS files
├── Gemfile              # Ruby dependencies
└── index.html           # Homepage
```

## Writing Posts

Create a new file in the `_posts` directory with the format:

```
YYYY-MM-DD-post-title.md
```

Example frontmatter:

```yaml
---
title: My Post Title
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

## Deployment

This site uses GitHub Actions to automatically build and deploy to GitHub Pages.

### Setup (One-time)

1. Go to your repository settings: `https://github.com/noppanit/noppanit.github.io/settings/pages`
2. Under "Build and deployment" → "Source", select **"GitHub Actions"**
3. Save the settings

### Deploying Changes

Simply push to the `source` branch:

```bash
git add .
git commit -m "Your commit message"
git push origin source
```

GitHub Actions will automatically:
- Build the site with Jekyll 4.3
- Deploy to GitHub Pages
- Make it live at https://www.noppanit.com

You can monitor the build progress in the "Actions" tab of your GitHub repository.

### Manual Deployment (Alternative)

If you prefer to build locally and deploy manually:

1. Build the site: `bundle exec jekyll build`
2. The output will be in `_site/`
3. Deploy the `_site` contents to the `master` branch

## Configuration

Edit `_config.yml` to customize:

- Site title, description, and URL
- Social media usernames
- Permalink structure
- Plugins

## Troubleshooting

### Port Already in Use

If port 4000 is already in use:

```bash
bundle exec jekyll serve --port 4001
```

### Clean Build

If you encounter build issues, try cleaning the build cache:

```bash
bundle exec jekyll clean
bundle exec jekyll build
```

### Update Dependencies

To update all gems to their latest compatible versions:

```bash
bundle update
```

## Tech Stack

- **Jekyll 4.3**: Static site generator
- **Kramdown**: Markdown processor
- **Jekyll Feed**: RSS feed generation

## License

Personal blog content and code.
