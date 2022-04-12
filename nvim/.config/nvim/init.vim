" ------------------------------------------------------------------- vim_plugs

call plug#begin('~/.config/nvim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'

" This must be set before Plug to work
" https://github.com/vim-pandoc/vim-pandoc/issues/342
let g:pandoc#filetypes#pandoc_markdown = 0
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'

Plug 'junegunn/goyo.vim'

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

" for RMarkdown
augroup rmarkdown_update
    autocmd!
    autocmd BufWritePost,FileWritePost *.Rmd silent :RMarkdown! pdf
augroup end

" numbers
set number
set relativenumber

" misc
set autochdir
set termguicolors
set colorcolumn=80 
set scrolloff=8
set foldmethod=indent

" ------------------------------------------------------------------ vim_colors

colorscheme PaperColor
set background=light

" ------------------------------------------------------------------ vim_vimtex

let g:vimtex_view_method = 'skim'

let g:vimtex_quickfix_ignore_filters = [
    \ 'badness 10000',
    \ 'Snakes have been superseded by decorations',
    \]

" ------------------------------------------------------------------ vim_pandoc

" turn off default conceal
let g:pandoc#syntax#conceal#use = 0

" turn off spell check
let g:pandoc#spell#enabled = 0

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
