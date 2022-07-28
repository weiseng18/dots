" -------------------------------------------------------------------- contents
" vim_plugs
" vim_sets
" vim_colors
" vim_vimtex
" vim_pandoc
" vim_ultisnips
" vim_remaps
" vim_abbrevs

" ------------------------------------------------------------------- vim_plugs

call plug#begin('~/.config/nvim/plugged')

" -------- visuals

Plug 'NLKNguyen/papercolor-theme'       " theme
Plug 'junegunn/goyo.vim'                " minimalistic editing

" -------- language specific support
Plug 'lervag/vimtex'                    " Compile LaTeX

" This must be set before Plug to work
" https://github.com/vim-pandoc/vim-pandoc/issues/342
let g:pandoc#filetypes#pandoc_markdown = 0
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'         " Compile RMarkdown

" -------- Snippets

Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" -------- LSP

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" -------- Wakatime

Plug 'wakatime/vim-wakatime'

" -------- Telescope

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" -------------------------------------------------------------------- vim_sets

lua require("user/lsp")
lua require("user/nvim_cmp")
lua require("user/_telescope")

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

" 2 spaces for lua
autocmd Filetype lua setlocal tabstop=2 softtabstop=2 shiftwidth=2

" 2 spaces for json, javascript, typescript, tsx, css
autocmd Filetype json,javascript,typescript,typescriptreact,css setlocal tabstop=2 softtabstop=2 shiftwidth=2

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

" statusline
set statusline=%F               " set full file path in buffer
set statusline+=\ %m            " is modified
set statusline+=%=              " switch to the right side
set statusline+=Line\ %l/%L     " line info

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
nnoremap <leader>gw :%s/\s\+$//g<CR>   " Get rid of trailing whitespace
nnoremap <leader>ga :%y+<CR> " Get all lines (copy)
nnoremap <leader>ge "+y$ " Get rest of line (copy)

" show lsp error in a floating box
nnoremap <leader>er :lua vim.diagnostic.open_float()<CR>

" tabs
nnoremap ˙ gT
nnoremap ¬ gt

" ----------------------------------------------------------------- vim_abbrevs

cnoreabbrev pc PlugClean
cnoreabbrev pi PlugInstall
cnoreabbrev pu PlugUpdate
cnoreabbrev te tabedit
cnoreabbrev ue UltiSnipsEdit
