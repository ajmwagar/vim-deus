# vim-deus

Deus was created out of sheer rage caused by all of the bad Solarized/Gruvbox clones.
I was tired of them. I needed something original, something new. So if you are like me, and I believe many of you are...

I present you **deus** 

---


## Screenshots

GVIM: 
![alt-text](https://github.com/ajmwagar/vim-deus/blob/master/screencaps/ScreencapYCM.png "deus Colorscheme")

GVIM + YCM:

![alt-text](https://github.com/ajmwagar/vim-deus/blob/master/screencaps/Deus.png "deus Colorscheme")

GVIM + Pylint + Syntastic:

![alt-text](https://github.com/ajmwagar/vim-deus/blob/master/screencaps/Pylint.png "deus Colorscheme")

Airline theme
![img](https://github.com/ajmwagar/vim-deus/blob/master/screencaps/Airline.png)

Terminal (Neo)vim

![img](https://github.com/ajmwagar/vim-deus/blob/master/screencaps/deusLinux.jpeg?raw=true)

NERDTree
![img](https://github.com/ajmwagar/vim-deus/blob/master/screencaps/duesNerdtree.jpeg?raw=true)

---



## Installation

Manual: place `deus.vim` in your `vimfiles/colors` folder and add this line to your `.vimrc`
`colors deus`

**OR**

Use a package manager like Pathogen, Vundle, or Vim-plug just to name a few:

### Pathogen:

`cd ~/.vim/`

`mkdir bundle`

`cd bundle`

`git clone https://github.com/ajmwagar/vim-deus.git`

In your terminal


### Vim-Plug:
add the following lines to your .vimrc:

```
call plug#begin('~/.vim/bundle/')
Plug 'ajmwagar/vim-deus'
cal  plug#end()
```
Don't forget to run:

`:PlugInstall`


---

## Language Syntax Support:

- Lua
- Go
- **JavaScript** 
- **CSS/HTML**
- PHP
- **C#**
- JSON
- **Markdown**
- Haskell
- Scala
- Elixir
- Java
- MoonScript
- Objective C
- C Languages
- CoffeeScript
- **Ruby**
- **Rust**
- **Python**
- Clojure
- XML
- Any many more... (try [vim-polyglot](https://github.com/sheerun/vim-polyglot) for syntax packs)

**Bold** = really nice looking (They all look good but these are my personal favorites.)

---

## Plugin support

- Airline `:AirlineTheme deus`
- coc.nvim (popup-windows & error colors)
- Ctrlp
- FZF
- NerdTREE
- Syntastic (and most linters)
- Deoplete
- YCM (YouCompleteMe)
- Tabbar
- Vim-easy-motion
- Sneak
- Rainbow-Parentheses

---

## Palette

| Color                                                  | Hex     | Use           |
|--------------------------------------------------------|---------|---------------|
| ![foreground](https://www.colorhexa.com/eaeaea.png)    | #eaeaea | foreground    |
| ![background](https://www.colorhexa.com/2c323b.png)    | #2c323b | background    |
| ![white](https://www.colorhexa.com/ffffff.png)         | #ffffff | white         |
| ![black](https://www.colorhexa.com/000000.png)         | #000000 | black         |
| ![red](https://www.colorhexa.com/d54e53.png)           | #d54e53 | red           |
| ![green](https://www.colorhexa.com/98c379.png)         | #98c379 | green         |
| ![yellow](https://www.colorhexa.com/e5c07b.png)        | #e5c07b | yellow        |
| ![teal](https://www.colorhexa.com/83a598.png)          | #83a598 | teal          |
| ![purple](https://www.colorhexa.com/c678dd.png)        | #c678dd | purple        |
| ![bright-teal](https://www.colorhexa.com/70c0ba.png)   | #70c0ba | bright teal   |
| ![gray](https://www.colorhexa.com/666666.png)          | #666666 | gray          |
| ![bright-red](https://www.colorhexa.com/ec3e45.png)    | #ec3e45 | bright red    |
| ![bright-green](https://www.colorhexa.com/90c966.png)  | #90c966 | bright green  |
| ![bright-yellow](https://www.colorhexa.com/edbf69.png) | #edbf69 | bright yellow |
| ![bright-blue](https://www.colorhexa.com/2bcec2.png)   | #2bcec2 | bright blue   |
| ![bright-purple](https://www.colorhexa.com/c858e9.png) | #c858e9 | bright purple |


## Troubleshooting

When using terminal-vim and vim-deus the colors
can get messed up.

To fix this add the following snippet to your ~/.vimrc:

`set t_Co=256`

`set termguicolors` 

`let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"`

`let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"`

`set background=dark    " Setting dark mode`

`colorscheme deus`

`let g:deus_termcolors=256`

### Tmux

Instructions on how to enable TrueColor for Tmux can be found [here](https://gist.github.com/parmort/4d95555b3f9435fa953f0b7c67c86e8f).

### Italics

If you use vim in a terminal that supports italics, set the environment variable TERM_ITALICS to TRUE to enable with vim-deus.

---

## Thank You
I took **a lot** of inspiration from two great colorschemes, 
[Onedark](https://github.com/joshdick/onedark.vim) and
[Gruvbox](https://github.com/morhetz/gruvbox). I want to thank their creators for making such great
color schemes. So thank you!
