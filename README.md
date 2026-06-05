# OceanicNeutral

A **neutral-grey** fork of [OceanicNext](https://github.com/mhartington/oceanic-next),
tuned for modern Neovim (0.12, truecolor).

OceanicNext is a great theme, but its base tones are slightly **blue-grey**. Under
truecolor those blue tints become visible everywhere — the statusline fill, the
visual selection, comments, splits, the file-tree cursor line. OceanicNeutral keeps
the whole OceanicNext palette **except** it replaces those blue-grey base tones with
**neutral greys**, and nudges the blue to match the classic 256-colour rendering.

## What changed vs OceanicNext

| Role | OceanicNext | OceanicNeutral |
|------|-------------|----------------|
| `base01` — bar / cursorline fill | `#343d46` (blue-grey) | `#3a3a3a` (neutral) |
| `base02` — visual selection | `#4f5b66` (blue-grey) | `#585858` (neutral) |
| `base03` — comments / inactive / splits | `#65737e` (blue-grey) | `#767676` (neutral) |
| blue — directories / functions | `#6699cc` | `#5f87d7` (more saturated) |

Everything else (red/orange/yellow/green/cyan/purple, foregrounds) is unchanged.

## Install

**lazy.nvim**
```lua
{ "avral/OceanicNeutral", lazy = false, priority = 1000,
  config = function() vim.cmd.colorscheme("OceanicNeutral") end }
```

**vim-plug**
```vim
Plug 'avral/OceanicNeutral'
colorscheme OceanicNeutral
```

The highlight engine from OceanicNext (`autoload/oceanic_next.vim`) is bundled, so
no extra dependency is required.

## Usage

```vim
set termguicolors
colorscheme OceanicNeutral
```

### vim-airline

A companion airline theme is included — neutral-grey bar, saturated-green accent,
explicit tabline palette (so it stays dark on Neovim 0.12):

```vim
let g:airline_theme = 'oceanic_neutral'
```

## Credits

Based on [OceanicNext](https://github.com/mhartington/oceanic-next) by
Mike Hartington (Apache-2.0). See `NOTICE`.

## License

MIT — see `LICENSE`.

The bundled highlight engine `autoload/oceanic_next.vim` is from OceanicNext and
remains under Apache-2.0 — see `LICENSE-OceanicNext` and `NOTICE`.
