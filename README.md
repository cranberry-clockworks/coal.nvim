# coal.nvim
A simple, mostly greyscale theme for NeoVim.

The theme doesn't use any accent colours. There are shades of black and grey
only. The diff view is gray scaled too. Only exceptions is for LSP warning and
errors which have standard orange and red colours.

## Screenshots

### Lua

![Screenshot 2022-09-08 at 21 03 19](https://user-images.githubusercontent.com/77539239/189206175-e79271a3-9d7c-4af0-80e1-2cab4cc3a0b3.png)

### C# with errors and warnings
![Screenshot 2022-09-08 at 21 04 26](https://user-images.githubusercontent.com/77539239/189206233-957c2175-79a0-4cec-84e7-0444564439f1.png)

### Telescope
![Screenshot 2022-09-08 at 21 06 28](https://user-images.githubusercontent.com/77539239/189206267-23ea48be-cc29-4932-a7f9-83a56824534d.png)

### The diff view
![Screenshot 2022-09-08 at 21 09 27](https://user-images.githubusercontent.com/77539239/189206305-059e72b6-7b40-4595-877d-0a849f4da369.png)

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
But feel free to modify or extend for your needs 🙂
