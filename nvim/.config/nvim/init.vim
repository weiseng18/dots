" ------------------------------------------------------------------- vim_plugs

call plug#begin('~/.config/nvim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'

call plug#end()

" -------------------------------------------------------------------- vim_sets

" indents
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

set wrap linebreak
set breakindent
set autoindent

" 2 spaces for latex
autocmd Filetype tex setlocal tabstop=2 softtabstop=2 shiftwidth=2

" numbers
set number
set relativenumber

" misc
set autochdir
set termguicolors
set colorcolumn=80 

" ------------------------------------------------------------------ vim_colors

colorscheme PaperColor
set background=light

" ------------------------------------------------------------------ vim_vimtex

let g:vimtex_view_method = 'skim'

" --------------------------------------------------------------- vim_ultisnips

" to allow ultisnips triggers to function properly
" map! <C-h> <Nop>

let g:UltiSnipsSnippetsDir = '$DOTS/nvim/.config/nvim/ultisnips'

let g:UltiSnipsExpandTrigger       = '<Tab>'
let g:UltiSnipsJumpForwardTrigger  = '<C-l>'
let g:UltiSnipsJumpBackwardTrigger = '<C-h>'
let g:UltiSnipsEditSplit           = 'vertical'

" ------------------------------------------------------------------ vim_remaps

nnoremap <Space> <Nop>
let mapleader = " "
nnoremap <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <leader>r :source $MYVIMRC<CR>

" tabs
nnoremap ˙ gT 
nnoremap ¬ gt
