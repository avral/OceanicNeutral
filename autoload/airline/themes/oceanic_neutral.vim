" ===============================================================
" Airline-тема под OceanicNeutral — форк companion-темы hybrid.
" Здесь живут ВСЕ цвета бара/табов airline (своя система тем, colorscheme её не видит).
" Отличия от hybrid:
"   * зелёный акцент насыщеннее  #99c794 -> #87d787  (как докер, xterm-114)
"   * фон бара нейтральный серый  #343d46 -> #3a3a3a
"   * пилюля таба нейтральная     #65737e -> #767676
"   * явная палитра табов (иначе nvim 0.12 светлит плашку из ванильных TabLine*)
" ===============================================================

let g:airline#themes#oceanic_neutral#palette = {}

" Замена сине-серой базы на нейтральную + бамп зелёного. Рекурсивно по палитре.
function! s:neutralize(palette) abort
  for l:mode in values(a:palette)
    if type(l:mode) != v:t_dict | continue | endif
    for l:grp in values(l:mode)
      if type(l:grp) != v:t_list || len(l:grp) < 2 | continue | endif
      if type(l:grp[0]) == v:t_string && l:grp[0] ==? '#99c794' | let l:grp[0] = '#87d787' | endif
      if type(l:grp[1]) == v:t_string
        if l:grp[1] ==? '#343d46' | let l:grp[1] = '#3a3a3a' | endif
        if l:grp[1] ==? '#65737e' | let l:grp[1] = '#767676' | endif
      endif
    endfor
  endfor
endfunction

function! airline#themes#oceanic_neutral#refresh()
    " --- статусбар: деривация как в hybrid (из групп colorscheme) ---
    let s:N1 = airline#themes#get_highlight('DiffAdd')
    let s:N2 = airline#themes#get_highlight('CursorLine')
    let s:N3 = airline#themes#get_highlight('PMenu')
    let g:airline#themes#oceanic_neutral#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
    let g:airline#themes#oceanic_neutral#palette.normal_modified = {}

    let warning_group = airline#themes#get_highlight('SpellRare')
    let g:airline#themes#oceanic_neutral#palette.normal.airline_warning = warning_group
    let g:airline#themes#oceanic_neutral#palette.normal_modified.airline_warning = warning_group

    let s:I1 = airline#themes#get_highlight2(['Text', 'fg'], ['DiffText', 'bg'], 'bold')
    let s:I2 = s:N2
    let s:I3 = s:N3
    let g:airline#themes#oceanic_neutral#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
    let g:airline#themes#oceanic_neutral#palette.insert_modified = g:airline#themes#oceanic_neutral#palette.normal_modified
    let g:airline#themes#oceanic_neutral#palette.insert.airline_warning = g:airline#themes#oceanic_neutral#palette.normal.airline_warning
    let g:airline#themes#oceanic_neutral#palette.insert_modified.airline_warning = g:airline#themes#oceanic_neutral#palette.normal_modified.airline_warning

    let s:R1 = airline#themes#get_highlight('DiffChange')
    let s:R2 = s:N2
    let s:R3 = s:N3
    let g:airline#themes#oceanic_neutral#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
    let g:airline#themes#oceanic_neutral#palette.replace_modified = g:airline#themes#oceanic_neutral#palette.normal_modified
    let g:airline#themes#oceanic_neutral#palette.replace.airline_warning = g:airline#themes#oceanic_neutral#palette.normal.airline_warning
    let g:airline#themes#oceanic_neutral#palette.replace_modified.airline_warning = g:airline#themes#oceanic_neutral#palette.replace_modified.airline_warning

    let s:V1 = airline#themes#get_highlight2(['Text', 'fg'], ['DiffDelete', 'bg'], 'bold')
    let s:V2 = s:N2
    let s:V3 = s:N3
    let g:airline#themes#oceanic_neutral#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
    let g:airline#themes#oceanic_neutral#palette.visual_modified = g:airline#themes#oceanic_neutral#palette.normal_modified
    let g:airline#themes#oceanic_neutral#palette.visual.airline_warning = g:airline#themes#oceanic_neutral#palette.normal.airline_warning
    let g:airline#themes#oceanic_neutral#palette.visual_modified.airline_warning = g:airline#themes#oceanic_neutral#palette.normal_modified.airline_warning

    let s:IA = airline#themes#get_highlight('StatusLineNC')
    let g:airline#themes#oceanic_neutral#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
    let g:airline#themes#oceanic_neutral#palette.inactive_modified = g:airline#themes#oceanic_neutral#palette.normal_modified

    let g:airline#themes#oceanic_neutral#palette.accents = {
                \ 'red': airline#themes#get_highlight('Constant'),
                \ }

    " --- табы: ЯВНАЯ палитра (не выводим из ванильных TabLine*) ---
    " [guifg, guibg, ctermfg, ctermbg, opts]
    let g:airline#themes#oceanic_neutral#palette.tabline = {
        \ 'airline_tab':      ['#3a3a3a', '#767676', 237, 243, ''],
        \ 'airline_tabsel':   ['#87d787', '#3a3a3a', 114, 237, ''],
        \ 'airline_tabtype':  ['#d8dee9', '#3a3a3a', 253, 237, 'bold'],
        \ 'airline_tabfill':  ['#a7adba', '#3a3a3a', 145, 237, ''],
        \ 'airline_tabmod':   ['#d8dee9', '#3a3a3a', 253, 237, 'bold'],
        \ 'airline_tabhid':   ['#a7adba', '#3a3a3a', 145, 237, ''],
        \ 'airline_tablabel': ['#d8dee9', '#3a3a3a', 253, 237, ''],
        \ }

    " --- финальная нейтрализация цветов, унаследованных из деривации ---
    call s:neutralize(g:airline#themes#oceanic_neutral#palette)
endfunction

call airline#themes#oceanic_neutral#refresh()
