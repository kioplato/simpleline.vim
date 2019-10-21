" Notifications:
" ====================================================================
" 1.
" This status line cannot be installed with a plugin manager.
" Instead place it somewhere (ideally in your config directory)
" and then source it from your config file (ex. init.vim).
" ====================================================================
" 2.
" Disable any statusline plugins, as they will override this.
" ====================================================================
" 3.
" This statusline goes along onedark.vim colorscheme.
" It is required to have it installed.
" ====================================================================

" Have available all onedark.vim colors.
let s:colors = onedark#GetColors()
let s:red = s:colors.red.gui
let s:red_dark = s:colors.dark_red.gui
let s:green = s:colors.green.gui
let s:yellow = s:colors.yellow.gui
let s:yellow_dark = s:colors.dark_yellow.gui
let s:blue = s:colors.blue.gui
let s:purple = s:colors.purple.gui
let s:cyan = s:colors.cyan.gui
let s:white = s:colors.white.gui
let s:black = s:colors.black.gui
let s:black_visual = s:colors.visual_black.gui
let s:grey_comment = s:colors.comment_grey.gui
let s:grey_gutter = s:colors.gutter_fg_grey.gui
let s:grey_cursor = s:colors.cursor_grey.gui
let s:grey_visual = s:colors.visual_grey.gui
let s:grey_menu = s:colors.menu_grey.gui
let s:grey_special = s:colors.special_grey.gui
let s:vertsplit = s:colors.vertsplit.gui

" ~~~~ Statusline configuration ~~~~
" ':help statusline' is your friend!
function! RedrawModeColors(mode)
  " Normal mode
  if a:mode == 'n'
    exe 'hi MyStatuslineAccent guifg='.s:grey_visual.' gui=NONE guibg=NONE'
    exe 'hi MyStatuslineFilename guifg='.s:green.' gui=NONE guibg='.s:grey_cursor
    exe 'hi MyStatuslineAccentBody guibg='.s:grey_visual.' gui=bold guifg='.s:green
  " Insert mode
  elseif a:mode == 'i'
    exe 'hi MyStatuslineAccent guifg='.s:grey_visual.' gui=NONE guibg=NONE'
    exe 'hi MyStatuslineFilename guifg='.s:blue.' gui=NONE guibg='.s:grey_cursor
    exe 'hi MyStatuslineAccentBody guibg='.s:grey_visual.' gui=bold guifg='.s:blue
  " Replace mode
  elseif a:mode == 'R'
    exe 'hi MyStatuslineAccent guifg='.s:grey_visual.' gui=NONE guibg=NONE'
    exe 'hi MyStatuslineFilename guifg='.s:red.' gui=NONE guibg='.s:grey_cursor
    exe 'hi MyStatuslineAccentBody guibg='.s:grey_visual.' gui=bold guifg='.s:red
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
    exe 'hi MyStatuslineAccent guifg='.s:grey_visual.' gui=NONE guibg=NONE'
    exe 'hi MyStatuslineFilename guifg='.s:purple.' gui=NONE guibg='.s:grey_cursor
    exe 'hi MyStatuslineAccentBody guibg='.s:grey_visual.' gui=bold guifg='.s:purple
  " Command mode
  elseif a:mode == 'c'
    exe 'hi MyStatuslineAccent guifg='.s:grey_visual.' gui=NONE guibg=NONE'
    exe 'hi MyStatuslineFilename guifg='.s:cyan.' gui=NONE guibg='.s:grey_cursor
    exe 'hi MyStatuslineAccentBody guibg='.s:grey_visual.' gui=bold guifg='.s:cyan
  " Terminal mode
  elseif a:mode == 't'
    exe 'hi MyStatuslineAccent guifg='.s:grey_visual.' gui=NONE guibg=NONE'
    exe 'hi MyStatuslineFilename guifg='.s:red_dark.' gui=NONE guibg='.s:grey_cursor
    exe 'hi MyStatuslineAccentBody guibg='.s:grey_visual.' gui=bold guifg='.s:red_dark
  endif
  " Return empty string so as not to display anything in the statusline
  return ''
endfunction

function! SetModifiedSymbol(modified)
    if a:modified == 1
        exe 'hi MyStatuslineModifiedBody guibg='.s:grey_cursor.' gui=bold guifg='.s:red_dark
    else
        exe 'hi MyStatuslineModifiedBody guibg='.s:grey_cursor.' gui=bold guifg='.s:grey_visual
    endif
    return '●'
endfunction

function! SetFiletype(filetype)
  if a:filetype == ''
      return '-'
  else
      return a:filetype
  endif
endfunction

function! SetModeSymbol(mode)
	if a:mode == 'n'
		return 'N'
	elseif a:mode == 'i'
		return 'I'
	elseif a:mode == 'R'
		return 'R'
	elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
		return 'V'
	elseif a:mode == 'c'
		return 'C'
	elseif a:mode == 't'
		return 'T'
	endif
	" Return 'E' for Error.
	return 'E'
endfunction

" Statusbar items
" ====================================================================

" This will not be displayed, but the function RedrawModeColors will be
" called every time the mode changes, thus updating the colors used for the
" components.
set statusline=%{RedrawModeColors(mode())}
" Left side items.
" =======================
set statusline+=%#MyStatuslineAccent#
set statusline+=%#MyStatuslineAccentBody#\ %{SetModeSymbol(mode())}\ 
" Filename.
set statusline+=%#MyStatuslineFilename#\ %t\ 
set statusline+=%#MyStatuslineSeparator#\ 
" Modified status.
set statusline+=%#MyStatuslineModified#
set statusline+=%#MyStatuslineModifiedBody#%{SetModifiedSymbol(&modified)}
set statusline+=%#MyStatuslineModified#
" Right side items.
" =======================
set statusline+=%=
" Line and Column.
set statusline+=%#MyStatuslineLineCol#
set statusline+=%#MyStatuslineLineColBody#%2l
set statusline+=\/%#MyStatuslineLineColBody#%2c
set statusline+=%#MyStatuslineLineCol#
" Padding
set statusline+=\ 

" Current scroll percentage and total lines of the file.
set statusline+=%#MyStatuslinePercentage#
set statusline+=%#MyStatuslinePercentageBody#%P
set statusline+=\/\%#MyStatuslinePercentageBody#%L
set statusline+=%#MyStatuslinePercentage#
" Padding
set statusline+=\ 
" Filetype
set statusline+=%#MyStatuslineFiletype#
set statusline+=%#MyStatuslineFiletypeBody#\ %{SetFiletype(&filetype)}\ 
set statusline+=%#MyStatuslineFiletype#

" Setup the colors
exe 'hi StatusLine          guifg='.s:purple.'     guibg=NONE     gui=NONE'
exe 'hi StatusLineNC        guifg='.s:grey_cursor.'     guibg=NONE     gui=bold'

exe 'hi MyStatuslineSeparator guifg='.s:grey_cursor.' gui=NONE guibg=NONE'

exe 'hi MyStatuslineModified guifg='.s:grey_cursor.' gui=NONE guibg=NONE'

exe 'hi MyStatuslineFiletype guibg=NONE gui=NONE guifg='.s:grey_cursor
exe 'hi MyStatuslineFiletypeBody guifg='.s:purple.' gui=italic guibg='.s:grey_cursor

exe 'hi MyStatuslinePercentage guifg='.s:grey_cursor.' gui=NONE guibg=NONE'
exe 'hi MyStatuslinePercentageBody guibg='.s:grey_cursor.' gui=none guifg='.s:cyan

exe 'hi MyStatuslineLineCol guifg='.s:grey_cursor.' gui=NONE guibg=NONE'
exe 'hi MyStatuslineLineColBody guibg='.s:grey_cursor.' gui=none guifg='.s:yellow_dark
