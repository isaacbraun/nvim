# isaacbraun/nvim

## Introduction

*This is a fork of [nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) that moves from a single file to a multi file configuration.*

## External Dependencies

External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation),
  [fd-find](https://github.com/sharkdp/fd#installation)
- [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on the platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Emoji fonts (Ubuntu only, and only if you want emoji!) `sudo apt install fonts-noto-color-emoji`
- Language Setup:
  - If you want to write Typescript, you need `npm`
  - If you want to write Golang, you will need `go`
  - etc.

## Local MDX Language Server Patches

The Mason-installed `mdx-analyzer` currently needs two local workarounds. Mason may overwrite them when reinstalling or updating the package.

Patch this file:

```text
~/.local/share/nvim/mason/packages/mdx-analyzer/node_modules/@mdx-js/language-server/node_modules/vscode-markdown-languageservice/out/util/vscodeUri.js
```

Change:

```js
import uri from 'vscode-uri';
```

To:

```js
import * as uri from 'vscode-uri';
```

The stable `vscode-markdown-languageservice@0.5.0` release is ESM-only and is incompatible with the CommonJS `volar-service-markdown` dependency. Pin the last compatible prerelease:

```sh
cd ~/.local/share/nvim/mason/packages/mdx-analyzer/node_modules/@mdx-js/language-server
npm install --no-save --package-lock=false vscode-markdown-languageservice@0.5.0-alpha.11
```

TypeScript-aware MDX completion, diagnostics, and component prop information also require `typescript` in the MDX project:

```sh
npm install --save-dev typescript
```
