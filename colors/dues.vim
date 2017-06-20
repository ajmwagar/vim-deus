" -----------------------------------------------------------------------------
" File: deus.vim
" Description: a retro-modern colorscheme in Vim
" Author: ajmwagar
" Source: https://github.com/ajmwagar/dues
" Last Modified: 04 Sep 2015
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='dues'

if !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:dues_bold')
  let g:dues_bold=1
endif
if !exists('g:dues_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:dues_italic=1
  else
    let g:dues_italic=0
  endif
endif
if !exists('g:dues_undercurl')
  let g:dues_undercurl=1
endif
if !exists('g:dues_underline')
  let g:dues_underline=1
endif
if !exists('g:dues_inverse')
  let g:dues_inverse=1
endif

if !exists('g:dues_guisp_fallback') || index(['fg', 'bg'], g:dues_guisp_fallback) == -1
  let g:dues_guisp_fallback='NONE'
endif

if !exists('g:dues_improved_strings')
  let g:dues_improved_strings=0
endif

if !exists('g:dues_improved_warnings')
  let g:dues_improved_warnings=0
endif

if !exists('g:dues_termcolors')
  let g:dues_termcolors=256
endif

if !exists('g:dues_invert_indent_guides')
  let g:dues_invert_indent_guides=0
endif

if exists('g:dues_contrast')
  echo 'g:dues_contrast is deprecated; use g:dues_contrast_light and g:dues_contrast_dark instead'
endif

if !exists('g:dues_contrast_dark')
  let g:dues_contrast_dark='medium'
endif

if !exists('g:dues_contrast_light')
  let g:dues_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:ds = {}

" fill it with absolute colors
let s:ds.dark0_hard  = ['#2C313A', 234]     " 29-32-33
let s:ds.dark0       = ['#2C323B', 235]     " 40-40-40
let s:ds.dark0_soft  = ['#28282f', 236]     " 50-48-47
let s:ds.dark1       = ['#3c3836', 237]     " 60-56-54
let s:ds.dark2       = ['#2C313A', 239]     " 80-73-69
let s:ds.dark3       = ['#665c54', 241]     " 102-92-84
let s:ds.dark4       = ['#7c6f64', 243]     " 124-111-100
let s:ds.dark4_256   = ['#7c6f64', 243]     " 124-111-100

let s:ds.gray_245    = ['#928374', 245]     " 146-131-116
let s:ds.gray_244    = ['#928374', 244]     " 146-131-116

let s:ds.light0_hard = ['#f9f5d7', 230]     " 249-245-215
let s:ds.light0      = ['#fdf4c1', 229]     " 253-244-193
let s:ds.light0_soft = ['#f2e5bc', 228]     " 242-229-188
let s:ds.light1      = ['#ebdbb2', 223]     " 235-219-178
let s:ds.light2      = ['#d5c4a1', 250]     " 213-196-161
let s:ds.light3      = ['#bdae93', 248]     " 189-174-147
let s:ds.light4      = ['#a89984', 246]     " 168-153-132
let s:ds.light4_256  = ['#a89984', 246]     " 168-153-132

let s:ds.bright_red     = ['#fb4934', 167]     " 251-73-52
let s:ds.bright_green   = ['#98C379', 142]     " 184-187-38
let s:ds.bright_yellow  = ['#fabd2f', 214]     " 250-189-47
let s:ds.bright_blue    = ['#83a598', 109]     " 131-165-152
let s:ds.bright_purple  = ['#C678DD', 175]     " 211-134-155
let s:ds.bright_aqua    = ['#8ec07c', 108]     " 142-192-124
let s:ds.bright_orange  = ['#fe8019', 208]     " 254-128-25

let s:ds.neutral_red    = ['#cc241d', 124]     " 204-36-29
let s:ds.neutral_green  = ['#98971a', 106]     " 152-151-26
let s:ds.neutral_yellow = ['#d79921', 172]     " 215-153-33
let s:ds.neutral_blue   = ['#458588', 66]      " 69-133-136
let s:ds.neutral_purple = ['#b16286', 132]     " 177-98-134
let s:ds.neutral_aqua   = ['#689d6a', 72]      " 104-157-106
let s:ds.neutral_orange = ['#d65d0e', 166]     " 214-93-14

let s:ds.faded_red      = ['#9d0006', 88]      " 157-0-6
let s:ds.faded_green    = ['#79740e', 100]     " 121-116-14
let s:ds.faded_yellow   = ['#b57614', 136]     " 181-118-20
let s:ds.faded_blue     = ['#076678', 24]      " 7-102-120
let s:ds.faded_purple   = ['#8f3f71', 96]      " 143-63-113
let s:ds.faded_aqua     = ['#427b58', 66]      " 66-123-88
let s:ds.faded_orange   = ['#af3a03', 130]     " 175-58-3

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:dues_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:dues_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:dues_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:dues_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:dues_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:ds.dark0
  if g:dues_contrast_dark == 'soft'
    let s:bg0  = s:ds.dark0_soft
  elseif g:dues_contrast_dark == 'hard'
    let s:bg0  = s:ds.dark0_hard
  endif

  let s:bg1  = s:ds.dark1
  let s:bg2  = s:ds.dark2
  let s:bg3  = s:ds.dark3
  let s:bg4  = s:ds.dark4

  let s:gray = s:ds.gray_245

  let s:fg0 = s:ds.light0
  let s:fg1 = s:ds.light1
  let s:fg2 = s:ds.light2
  let s:fg3 = s:ds.light3
  let s:fg4 = s:ds.light4

  let s:fg4_256 = s:ds.light4_256

  let s:red    = s:ds.bright_red
  let s:green  = s:ds.bright_green
  let s:yellow = s:ds.bright_yellow
  let s:blue   = s:ds.bright_blue
  let s:purple = s:ds.bright_purple
  let s:aqua   = s:ds.bright_aqua
  let s:orange = s:ds.bright_orange
else
  let s:bg0  = s:ds.light0
  if g:dues_contrast_light == 'soft'
    let s:bg0  = s:ds.light0_soft
  elseif g:dues_contrast_light == 'hard'
    let s:bg0  = s:ds.light0_hard
  endif

  let s:bg1  = s:ds.light1
  let s:bg2  = s:ds.light2
  let s:bg3  = s:ds.light3
  let s:bg4  = s:ds.light4

  let s:gray = s:ds.gray_244

  let s:fg0 = s:ds.dark0
  let s:fg1 = s:ds.dark1
  let s:fg2 = s:ds.dark2
  let s:fg3 = s:ds.dark3
  let s:fg4 = s:ds.dark4

  let s:fg4_256 = s:ds.dark4_256

  let s:red    = s:ds.faded_red
  let s:green  = s:ds.faded_green
  let s:yellow = s:ds.faded_yellow
  let s:blue   = s:ds.faded_blue
  let s:purple = s:ds.faded_purple
  let s:aqua   = s:ds.faded_aqua
  let s:orange = s:ds.faded_orange
endif

" reset to 16 colors fallback
if g:dues_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:ds.bg0 = s:bg0
let s:ds.bg1 = s:bg1
let s:ds.bg2 = s:bg2
let s:ds.bg3 = s:bg3
let s:ds.bg4 = s:bg4

let s:ds.gray = s:gray

let s:ds.fg0 = s:fg0
let s:ds.fg1 = s:fg1
let s:ds.fg2 = s:fg2
let s:ds.fg3 = s:fg3
let s:ds.fg4 = s:fg4

let s:ds.fg4_256 = s:fg4_256

let s:ds.red    = s:red
let s:ds.green  = s:green
let s:ds.yellow = s:yellow
let s:ds.blue   = s:blue
let s:ds.purple = s:purple
let s:ds.aqua   = s:aqua
let s:ds.orange = s:orange

" }}}

" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:dues_hls_cursor')
  let s:hls_cursor = get(s:ds, g:dues_hls_cursor)
endif

let s:number_column = s:bg4
let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:dues_sign_column')
    let s:sign_column = get(s:ds, g:dues_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:dues_color_column')
  let s:color_column = get(s:ds, g:dues_color_column)
endif

let s:vert_split = s:bg2
if exists('g:dues_vert_split')
  let s:vert_split = get(s:ds, g:dues_vert_split)
endif

let s:invert_signs = ''
if exists('g:dues_invert_signs')
  if g:dues_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:dues_invert_selection')
  if g:dues_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:dues_invert_tabline')
  if g:dues_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:dues_italicize_comments')
  if g:dues_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:dues_italicize_strings')
  if g:dues_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:dues_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:dues_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" dues Hi Groups: {{{

" memoize common hi groups
call s:HL('duesFg0', s:fg0)
call s:HL('duesFg1', s:fg1)
call s:HL('duesFg2', s:fg2)
call s:HL('duesFg3', s:fg3)
call s:HL('duesFg4', s:fg4)
call s:HL('duesGray', s:gray)
call s:HL('duesBg0', s:bg0)
call s:HL('duesBg1', s:bg1)
call s:HL('duesBg2', s:bg2)
call s:HL('duesBg3', s:bg3)
call s:HL('duesBg4', s:bg4)

call s:HL('duesRed', s:red)
call s:HL('duesRedBold', s:red, s:none, s:bold)
call s:HL('duesGreen', s:green)
call s:HL('duesGreenBold', s:green, s:none, s:bold)
call s:HL('duesYellow', s:yellow)
call s:HL('duesYellowBold', s:yellow, s:none, s:bold)
call s:HL('duesBlue', s:blue)
call s:HL('duesBlueBold', s:blue, s:none, s:bold)
call s:HL('duesPurple', s:purple)
call s:HL('duesPurpleBold', s:purple, s:none, s:bold)
call s:HL('duesAqua', s:aqua)
call s:HL('duesAquaBold', s:aqua, s:none, s:bold)
call s:HL('duesOrange', s:orange)
call s:HL('duesOrangeBold', s:orange, s:none, s:bold)

call s:HL('duesRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('duesGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('duesYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('duesBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('duesPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('duesAquaSign', s:aqua, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/dues/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:vim_bg, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:vim_bg, s:bg4, s:bold . s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText duesBg2
hi! link SpecialKey duesBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:bg0, s:yellow)
call s:HL('IncSearch', s:bg0, s:hls_cursor)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg4, s:bg0, s:bold . s:inverse)
call s:HL('StatusLineNC', s:bg2, s:fg4, s:bold . s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:fg4, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory duesGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title duesGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:vim_bg, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg duesYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg duesYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question duesOrangeBold
" Warning messages
hi! link WarningMsg duesRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:dues_improved_strings == 0
  hi! link Special duesOrange
else
  call s:HL('Special', s:bg1, s:orange, s:italic)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement duesRed
" if, then, else, endif, swicth, etc.
hi! link Conditional duesRed
" for, do, while, etc.
hi! link Repeat duesRed
" case, default, etc.
hi! link Label duesRed
" try, catch, throw
hi! link Exception duesRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword duesRed

" Variable name
hi! link Identifier duesBlue
" Function name
hi! link Function duesGreenBold

" Generic preprocessor
hi! link PreProc duesAqua
" Preprocessor #include
hi! link Include duesAqua
" Preprocessor #define
hi! link Define duesAqua
" Same as Define
hi! link Macro duesAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit duesAqua

" Generic constant
hi! link Constant duesPurple
" Character constant: 'c', '/n'
hi! link Character duesPurple
" String constant: "this is a string"
if g:dues_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:bg1, s:fg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean duesPurple
" Number constant: 234, 0xff
hi! link Number duesPurple
" Floating point constant: 2.3e10
hi! link Float duesPurple

" Generic type
hi! link Type duesYellow
" static, register, volatile, etc
hi! link StorageClass duesOrange
" struct, union, enum, etc.
hi! link Structure duesAqua
" typedef
hi! link Typedef duesYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:dues_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link SneakPluginTarget Search
hi! link SneakStreakTarget Search
call s:HL('SneakStreakMask', s:yellow, s:yellow)
hi! link SneakStreakStatusLine Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:dues_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd duesGreenSign
hi! link GitGutterChange duesAquaSign
hi! link GitGutterDelete duesRedSign
hi! link GitGutterChangeDelete duesAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile duesGreen
hi! link gitcommitDiscardedFile duesRed

" }}}
" Signify: {{{

hi! link SignifySignAdd duesGreenSign
hi! link SignifySignChange duesAquaSign
hi! link SignifySignDelete duesRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign duesRedSign
hi! link SyntasticWarningSign duesYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   duesBlueSign
hi! link SignatureMarkerText duesPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl duesBlueSign
hi! link ShowMarksHLu duesBlueSign
hi! link ShowMarksHLo duesBlueSign
hi! link ShowMarksHLm duesBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch duesYellow
hi! link CtrlPNoEntries duesRed
hi! link CtrlPPrtBase duesBg2
hi! link CtrlPPrtCursor duesBlue
hi! link CtrlPLinePre duesBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket duesFg3
hi! link StartifyFile duesFg0
hi! link StartifyNumber duesBlue
hi! link StartifyPath duesGray
hi! link StartifySlash duesGray
hi! link StartifySection duesYellow
hi! link StartifySpecial duesBg2
hi! link StartifyHeader duesOrange
hi! link StartifyFooter duesBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded duesGreen
hi! link diffRemoved duesRed
hi! link diffChanged duesAqua

hi! link diffFile duesOrange
hi! link diffNewFile duesYellow

hi! link diffLine duesBlue

" }}}
" Html: {{{

hi! link htmlTag duesBlue
hi! link htmlEndTag duesBlue

hi! link htmlTagName duesAquaBold
hi! link htmlArg duesAqua

hi! link htmlScriptTag duesPurple
hi! link htmlTagN duesFg1
hi! link htmlSpecialTagName duesAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar duesOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag duesBlue
hi! link xmlEndTag duesBlue
hi! link xmlTagName duesBlue
hi! link xmlEqual duesBlue
hi! link docbkKeyword duesAquaBold

hi! link xmlDocTypeDecl duesGray
hi! link xmlDocTypeKeyword duesPurple
hi! link xmlCdataStart duesGray
hi! link xmlCdataCdata duesPurple
hi! link dtdFunction duesGray
hi! link dtdTagName duesPurple

hi! link xmlAttrib duesAqua
hi! link xmlProcessingDelim duesGray
hi! link dtdParamEntityPunct duesGray
hi! link dtdParamEntityDPunct duesGray
hi! link xmlAttribPunct duesGray

hi! link xmlEntity duesOrange
hi! link xmlEntityPunct duesOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation duesOrange
hi! link vimBracket duesOrange
hi! link vimMapModKey duesOrange
hi! link vimFuncSID duesFg3
hi! link vimSetSep duesFg3
hi! link vimSep duesFg3
hi! link vimContinue duesFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword duesBlue
hi! link clojureCond duesOrange
hi! link clojureSpecial duesOrange
hi! link clojureDefine duesOrange

hi! link clojureFunc duesYellow
hi! link clojureRepeat duesYellow
hi! link clojureCharacter duesAqua
hi! link clojureStringEscape duesAqua
hi! link clojureException duesRed

hi! link clojureRegexp duesAqua
hi! link clojureRegexpEscape duesAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen duesFg3
hi! link clojureAnonArg duesYellow
hi! link clojureVariable duesBlue
hi! link clojureMacro duesOrange

hi! link clojureMeta duesYellow
hi! link clojureDeref duesYellow
hi! link clojureQuote duesYellow
hi! link clojureUnquote duesYellow

" }}}
" C: {{{

hi! link cOperator duesPurple
hi! link cStructure duesOrange

" }}}
" Python: {{{

hi! link pythonBuiltin duesOrange
hi! link pythonBuiltinObj duesOrange
hi! link pythonBuiltinFunc duesOrange
hi! link pythonFunction duesAqua
hi! link pythonDecorator duesRed
hi! link pythonInclude duesBlue
hi! link pythonImport duesBlue
hi! link pythonRun duesBlue
hi! link pythonCoding duesBlue
hi! link pythonOperator duesRed
hi! link pythonExceptions duesPurple
hi! link pythonBoolean duesPurple
hi! link pythonDot duesFg3

" }}}
" CSS: {{{

hi! link cssBraces duesBlue
hi! link cssFunctionName duesYellow
hi! link cssIdentifier duesOrange
hi! link cssClassName duesGreen
hi! link cssColor duesBlue
hi! link cssSelectorOp duesBlue
hi! link cssSelectorOp2 duesBlue
hi! link cssImportant duesGreen
hi! link cssVendor duesFg1

hi! link cssTextProp duesAqua
hi! link cssAnimationProp duesAqua
hi! link cssUIProp duesYellow
hi! link cssTransformProp duesAqua
hi! link cssTransitionProp duesAqua
hi! link cssPrintProp duesAqua
hi! link cssPositioningProp duesYellow
hi! link cssBoxProp duesAqua
hi! link cssFontDescriptorProp duesAqua
hi! link cssFlexibleBoxProp duesAqua
hi! link cssBorderOutlineProp duesAqua
hi! link cssBackgroundProp duesAqua
hi! link cssMarginProp duesAqua
hi! link cssListProp duesAqua
hi! link cssTableProp duesAqua
hi! link cssFontProp duesAqua
hi! link cssPaddingProp duesAqua
hi! link cssDimensionProp duesAqua
hi! link cssRenderProp duesAqua
hi! link cssColorProp duesAqua
hi! link cssGeneratedContentProp duesAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces duesFg1
hi! link javaScriptFunction duesAqua
hi! link javaScriptIdentifier duesRed
hi! link javaScriptMember duesBlue
hi! link javaScriptNumber duesPurple
hi! link javaScriptNull duesPurple
hi! link javaScriptParens duesFg3

" }}}
" YAJS: {{{

hi! link javascriptImport duesAqua
hi! link javascriptExport duesAqua
hi! link javascriptClassKeyword duesAqua
hi! link javascriptClassExtends duesAqua
hi! link javascriptDefault duesAqua

hi! link javascriptClassName duesYellow
hi! link javascriptClassSuperName duesYellow
hi! link javascriptGlobal duesYellow

hi! link javascriptEndColons duesFg1
hi! link javascriptFuncArg duesFg1
hi! link javascriptGlobalMethod duesFg1
hi! link javascriptNodeGlobal duesFg1

" hi! link javascriptVariable duesOrange
hi! link javascriptVariable duesPurple
" hi! link javascriptIdentifier duesOrange
" hi! link javascriptClassSuper duesOrange
hi! link javascriptIdentifier duesOrange
hi! link javascriptClassSuper duesOrange

" hi! link javascriptFuncKeyword duesOrange
" hi! link javascriptAsyncFunc duesOrange
hi! link javascriptFuncKeyword duesAqua
hi! link javascriptAsyncFunc duesAqua
hi! link javascriptClassStatic duesOrange

hi! link javascriptOperator duesRed
hi! link javascriptForOperator duesRed
hi! link javascriptYield duesRed
hi! link javascriptExceptions duesRed
hi! link javascriptMessage duesRed

hi! link javascriptTemplateSB duesAqua
hi! link javascriptTemplateSubstitution duesFg1

" hi! link javascriptLabel duesBlue
" hi! link javascriptObjectLabel duesBlue
" hi! link javascriptPropertyName duesBlue
hi! link javascriptLabel duesFg1
hi! link javascriptObjectLabel duesFg1
hi! link javascriptPropertyName duesFg1

hi! link javascriptLogicSymbols duesFg1
hi! link javascriptArrowFunc duesFg1

hi! link javascriptDocParamName duesFg4
hi! link javascriptDocTags duesFg4
hi! link javascriptDocNotation duesFg4
hi! link javascriptDocParamType duesFg4
hi! link javascriptDocNamedParamType duesFg4

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp duesFg3
hi! link coffeeSpecialOp duesFg3
hi! link coffeeCurly duesOrange
hi! link coffeeParen duesFg3
hi! link coffeeBracket duesOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter duesGreen
hi! link rubyInterpolationDelimiter duesAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier duesRed
hi! link objcDirective duesBlue

" }}}
" Go: {{{

hi! link goDirective duesAqua
hi! link goConstants duesPurple
hi! link goDeclaration duesRed
hi! link goDeclType duesBlue
hi! link goBuiltins duesOrange

" }}}
" Lua: {{{

hi! link luaIn duesRed
hi! link luaFunction duesAqua
hi! link luaTable duesOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp duesFg3
hi! link moonExtendedOp duesFg3
hi! link moonFunction duesFg3
hi! link moonObject duesYellow

" }}}
" Java: {{{

hi! link javaAnnotation duesBlue
hi! link javaDocTags duesAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen duesFg3
hi! link javaParen1 duesFg3
hi! link javaParen2 duesFg3
hi! link javaParen3 duesFg3
hi! link javaParen4 duesFg3
hi! link javaParen5 duesFg3
hi! link javaOperator duesOrange

hi! link javaVarArg duesGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter duesGreen
hi! link elixirInterpolationDelimiter duesAqua

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition duesFg1
hi! link scalaCaseFollowing duesFg1
hi! link scalaCapitalWord duesFg1
hi! link scalaTypeExtension duesFg1

hi! link scalaKeyword duesRed
hi! link scalaKeywordModifier duesRed

hi! link scalaSpecial duesAqua
hi! link scalaOperator duesFg1

hi! link scalaTypeDeclaration duesYellow
hi! link scalaTypeTypePostDeclaration duesYellow

hi! link scalaInstanceDeclaration duesFg1
hi! link scalaInterpolation duesAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 duesGreenBold
hi! link markdownH2 duesGreenBold
hi! link markdownH3 duesYellowBold
hi! link markdownH4 duesYellowBold
hi! link markdownH5 duesYellow
hi! link markdownH6 duesYellow

hi! link markdownCode duesAqua
hi! link markdownCodeBlock duesAqua
hi! link markdownCodeDelimiter duesAqua

hi! link markdownBlockquote duesGray
hi! link markdownListMarker duesGray
hi! link markdownOrderedListMarker duesGray
hi! link markdownRule duesGray
hi! link markdownHeadingRule duesGray

hi! link markdownUrlDelimiter duesFg3
hi! link markdownLinkDelimiter duesFg3
hi! link markdownLinkTextDelimiter duesFg3

hi! link markdownHeadingDelimiter duesOrange
hi! link markdownUrl duesPurple
hi! link markdownUrlTitleDelimiter duesGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType duesYellow
" hi! link haskellOperators duesOrange
" hi! link haskellConditional duesAqua
" hi! link haskellLet duesOrange
"
hi! link haskellType duesFg1
hi! link haskellIdentifier duesFg1
hi! link haskellSeparator duesFg1
hi! link haskellDelimiter duesFg4
hi! link haskellOperators duesBlue
"
hi! link haskellBacktick duesOrange
hi! link haskellStatement duesOrange
hi! link haskellConditional duesOrange

hi! link haskellLet duesAqua
hi! link haskellDefault duesAqua
hi! link haskellWhere duesAqua
hi! link haskellBottom duesAqua
hi! link haskellBlockKeywords duesAqua
hi! link haskellImportKeywords duesAqua
hi! link haskellDeclKeyword duesAqua
hi! link haskellDeriving duesAqua
hi! link haskellAssocType duesAqua

hi! link haskellNumber duesPurple
hi! link haskellPragma duesPurple

hi! link haskellString duesGreen
hi! link haskellChar duesGreen

" }}}
" Json: {{{

hi! link jsonKeyword duesGreen
hi! link jsonQuote duesGreen
hi! link jsonBraces duesFg1
hi! link jsonString duesFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! DuesHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! DuesHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
