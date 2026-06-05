" ===============================================================
" OceanicNeutral — форк OceanicNext (Mike Hartington) под новый neovim.
" Единственное отличие: сине-серая база base01/02/03 заменена на НЕЙТРАЛЬНО-серую.
" Остальная палитра и вся раскраска — из плагина (oceanic_next#highlight).
" ===============================================================

" {{{ Setup
  if exists('g:colors_name')
     highlight clear
     if exists('syntax_on')
       syntax reset
     endif
  endif
  let g:colors_name="OceanicNeutral"

" Colors {{{
  let s:base00 = ['#1b2b34', '235']
  let s:base01 = ['#3a3a3a', '237']   " было #343d46 (сине-серый) -> нейтральный
  let s:base02 = ['#585858', '240']   " было #4f5b66 (сине-серый) -> нейтральный
  let s:base03 = ['#767676', '243']   " было #65737e (сине-серый) -> нейтральный
  let s:base04 = ['#a7adba', '145']
  let s:base05 = ['#c0c5ce', '251']
  let s:base06 = ['#cdd3de', '252']
  let s:base07 = ['#d8dee9', '253']
  let s:red    = ['#ec5f67', '203']
  let s:orange = ['#f99157', '209']
  let s:yellow = ['#fac863', '221']
  let s:green  = ['#99c794', '114']
  let s:cyan   = ['#62b3b2', '73']
  let s:blue   = ['#5f87d7', '68']   " было #6699cc; докеровский xterm-68 — синее/насыщеннее
  let s:purple = ['#c594c5', '176']
  let s:brown  = ['#ab7967', '137']
  let s:white  = ['#ffffff', '15']
  let s:none   = ['NONE',    'NONE']
" }}}

call oceanic_next#highlight(
  \ s:base00,
  \ s:base01,
  \ s:base02,
  \ s:base03,
  \ s:base04,
  \ s:base05,
  \ s:base06,
  \ s:base07,
  \ s:red,
  \ s:orange,
  \ s:yellow,
  \ s:green,
  \ s:cyan,
  \ s:blue,
  \ s:purple,
  \ s:brown,
  \ s:white,
  \ s:none
  \)
set background=dark

" ===============================================================
" Доводка под этот сетап — ПОВЕРХ базовой раскраски выше.
" Всё цветовое держим здесь, в теме. В init остаются только `set termguicolors`
" (настройка) и airline (у него своя система тем, colorscheme её не видит).
" ===============================================================

" Прозрачный фон — показываем фон терминала (iTerm).
hi Normal      guibg=NONE ctermbg=NONE
hi LineNr      guibg=NONE ctermbg=NONE
hi SignColumn  guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" Spell: подчёркивание/цвет, фон прозрачный.
hi SpellCap cterm=underline gui=underline ctermfg=243 guifg=#767676 guibg=NONE ctermbg=NONE
hi SpellBad cterm=NONE      gui=bold      ctermfg=203 guifg=#ec5f67 guibg=NONE ctermbg=NONE

" Pmenu (автокомплит): autoload темы его НЕ задаёт; под nvim 0.12 дефолт стал reverse.
hi Pmenu    cterm=NONE gui=NONE ctermfg=145 ctermbg=237 guifg=#a7adba guibg=#3a3a3a
hi PmenuSel cterm=NONE gui=NONE ctermfg=237 ctermbg=145 guifg=#3a3a3a guibg=#a7adba

" Плавающие окна (документация автокомплита, всплывашка диагностики): фон как у меню.
hi NormalFloat cterm=NONE gui=NONE ctermfg=145 ctermbg=237 guifg=#a7adba guibg=#3a3a3a

" coc: меню автокомплита (CocPumMenu->CocFloating) иначе падает в почти-чёрный NormalFloat.
hi CocFloating cterm=NONE gui=NONE ctermfg=145 ctermbg=237 guifg=#a7adba guibg=#3a3a3a

" NERDTree рут (NERDTreeCWD->Statement): красный, но БЕЗ bold.
hi NERDTreeCWD cterm=NONE gui=NONE ctermfg=203 guifg=#ec5f67

" Разделитель окон — еле виден (тонкая тёмная линия). В nvim 0.12 линию рисует
" WinSeparator; VertSplit оставляем для совместимости, neo-tree — свой вариант.
hi VertSplit          cterm=NONE gui=NONE ctermfg=240 ctermbg=NONE guifg=#585858 guibg=NONE
hi WinSeparator       cterm=NONE gui=NONE ctermfg=240 ctermbg=NONE guifg=#585858 guibg=NONE
hi NeoTreeWinSeparator cterm=NONE gui=NONE ctermfg=240 ctermbg=NONE guifg=#585858 guibg=NONE

" indent-blankline: чёрточки отступов (как старый indentLine, чуть светлее) +
" чуть ярче активный блок (scope).
hi IblIndent cterm=NONE gui=NONE ctermfg=240 guifg=#585858
hi IblScope  cterm=NONE gui=NONE ctermfg=243 guifg=#767676

" ALE-знаки в гаттере, фон прозрачный.
hi ALEErrorSign   guifg=#ff0000 guibg=NONE ctermfg=Red    ctermbg=NONE
hi ALEWarningSign guifg=#ffa500 guibg=NONE ctermfg=Yellow ctermbg=NONE
hi ALEInfoSign    guifg=#00ffff guibg=NONE ctermfg=Cyan   ctermbg=NONE
hi ALEHintSign    guifg=#808080 guibg=NONE ctermfg=Grey   ctermbg=NONE

" Signify (git-гаттер) — прозрачный фон знаков.
hi SignifySignAdd    guibg=NONE ctermbg=NONE
hi SignifySignChange guibg=NONE ctermbg=NONE
hi SignifySignDelete guibg=NONE ctermbg=NONE

" Gitsigns (git-гаттер) — только цветной символ, фон прозрачный.
hi GitSignsAdd          guifg=#99c794 guibg=NONE ctermfg=114 ctermbg=NONE
hi GitSignsChange       guifg=#5f87d7 guibg=NONE ctermfg=68  ctermbg=NONE
hi GitSignsDelete       guifg=#ec5f67 guibg=NONE ctermfg=203 ctermbg=NONE
hi GitSignsChangedelete guifg=#c594c5 guibg=NONE ctermfg=176 ctermbg=NONE
hi GitSignsTopdelete    guifg=#ec5f67 guibg=NONE ctermfg=203 ctermbg=NONE
" Число счётчика (show_count) — берёт цвет из этих групп.
hi! link GitSignsAddNr          GitSignsAdd
hi! link GitSignsChangeNr       GitSignsChange
hi! link GitSignsDeleteNr       GitSignsDelete
hi! link GitSignsChangedeleteNr GitSignsChangedelete
hi! link GitSignsTopdeleteNr    GitSignsTopdelete

" Treesitter @-группы (TODO/FIXME/типы). ПРИМ: подсветка treesitter сейчас выключена
" (highlight=false в init) — пока инертны, сработают если включишь ts-highlight.
hi  @comment.todo.comment   ctermfg=Yellow guifg=#fac863
hi  @comment.error.comment  ctermfg=Red    guifg=#ec5f67
hi  @comment.hotfix.comment ctermfg=Yellow guifg=#fac863
hi! link @variable.builtin Comment
hi! link @constant NONE
hi  @type ctermfg=104 guifg=#5f87d7
