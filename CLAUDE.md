# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Prelude is an Emacs distribution/configuration framework. The repo is a fork of the upstream Prelude project, with personal customizations in `personal/`.

## Testing

There is no traditional build system. The primary way to validate changes is:

```bash
emacs --batch --load init.el
```

This is what CI does (`.github/workflows/ci.yml`): it links the repo to `~/.emacs.d` and runs that command. A successful exit means the config loads without errors.

For Elisp code quality, use `checkdoc` inside Emacs (`C-c ? d` in `prelude-mode`).

## Architecture

### Initialization Flow

`init.el` is the entry point. It:
1. Validates Emacs version (25.1+ required)
2. Sets directory variables: `prelude-core-dir`, `prelude-modules-dir`, `prelude-personal-dir`, `prelude-vendor-dir`
3. Loads personal preload configs from `personal/preload/`
4. Loads all `core/` modules in order
5. Loads platform-specific file (`prelude-linux.el`, `prelude-macos.el`, etc.)
6. Loads opt-in modules listed in `personal/prelude-modules.el`
7. Loads all `personal/*.el` files

### Directory Layout

- `core/` — Core Prelude files loaded unconditionally. Key files:
  - `prelude-packages.el` — Package management and base package list (~32 packages auto-installed)
  - `prelude-editor.el` — Editing defaults (smartparens, whitespace, uniquify, etc.)
  - `prelude-custom.el` — User-facing custom variables
  - `prelude-mode.el` — `prelude-mode` minor mode definition
  - `prelude-global-keybindings.el` — Global keybindings
- `modules/` — Opt-in language/tool modules (44+). Users enable them via `personal/prelude-modules.el`
- `personal/` — User customizations (this fork's active config). Files here are loaded after modules.
- `snippets/` — YASnippet templates
- `docs/` — MkDocs documentation site

### Package Management

Packages are installed from MELPA via `use-package`. `prelude-packages.el` defines the base package list. Modules add their own packages. Everything lands in `elpa/` (gitignored).

### Personal Config (This Fork)

Active modules (`personal/prelude-modules.el`): vertico, company, org, c, css, emacs-lisp, js, lisp, lsp, perl, shell, web, xml, yaml, erc.

Notable personal additions: forge, magit, code-review, aider integration, BigQuery mode, custom keybindings.

## Emacs Lisp Conventions

- Use `prelude-` prefix for symbols in core files
- Use `use-package` for package configuration
- Module files in `modules/` are self-contained and should not depend on each other
- Personal files in `personal/` can depend on anything loaded before them
