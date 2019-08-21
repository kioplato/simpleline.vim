" Notification:
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
" This statusline goes along onedark.vim colorscheme. It is required
" to have it installed.
" ====================================================================

let s:colors = onedark#GetColors()
let s:red = s:colors.red.gui
let s:green = s:colors.green.gui
let s:yellow = s:colors.yellow.gui
let s:blue = s:colors.blue.gui
let s:purple = s:colors.purple.gui
let s:white = s:colors.white.gui
let s:black = s:colors.black.gui
let s:grey = s:colors.cursor_grey.gui
