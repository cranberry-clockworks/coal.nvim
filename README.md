# coal.nvim

A simple, mostly greyscale theme for NeoVim.

The theme doesn't use any accent colours. There are shades of black and grey
only. The diff view is gray scaled too. Only exceptions is for LSP warning and
errors which have standard orange and red colours.


## Screenshots
### Lua

<img width="1001" height="750" alt="Screenshot 2025-10-15 at 20 50 04" src="https://github.com/user-attachments/assets/9a669ff6-ebef-452c-bdc2-8dde9adc5fa1" />


### C# with errors and warnings

<img width="1001" height="750" alt="Screenshot 2025-10-15 at 20 52 56" src="https://github.com/user-attachments/assets/5ea9ffbc-a098-48b5-bce3-1baeb5f0d68c" />


### Telescope

<img width="1001" height="750" alt="Screenshot 2025-10-15 at 20 53 36" src="https://github.com/user-attachments/assets/51ada34b-0a35-41b9-93cf-8e87dbb8c3d9" />


### The diff view

<img width="1001" height="750" alt="Screenshot 2025-10-15 at 20 55 27" src="https://github.com/user-attachments/assets/fdc88498-72ac-4b60-bd1c-efca9abd9e6a" />


## Supported plugins highlight groups
- LSP
- nvim-treesitter
- vim-fugitive
- Telescope

## Installation

Install with your packer manager:

```lua
{
    'cranberry-clockworks/coal.nvim',
})
```

To enable the colourscheme, use the following Vim command:

```vim
colorscheme coal
```

or make a function call:

```lua
require('coal').setup()

```

## Colour palette

There are only 9 colours are defined:

- smoky_black = `#0C0C0C`
- eerie_black = `#1A1A1A`
- raisin_black = `#262626`
- dark_charcoal = `#303030`
- gray = `#7E7E7E`
- quick_silver = `#A5A5A5`
- chinese_silver = `#CCCCCC`
- anti_flash_white = `#F2F2F2`
- white = `#FFFFFF`

The main goal was picking up colours while keeping good readability and contrast
ratios.

This colourscheme leaving some defaults highlight groups untouched. This is by
design. Among them, for example: `CurSearch`, `ErrorMsg` or `WarningMsg`.


## Base colours overriding

Base colours could be overridden. Could be helpful to make background colour
completely black:

```lua
require('coal').setup({
    colors = {
        smoky_black = '#000000'
    }
}
```

## Further development
The theme is completed for my setup and I won't contribute to it for a while.
But feel free to modify or extend for your needs.
