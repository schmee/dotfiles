set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
set rtp+=/usr/local/opt/fzf

filetype plugin indent on
call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kassio/neoterm'
Plug 'mboughaba/vim-lessmess'
Plug 'mhinz/vim-startify'
Plug 'mtth/scratch.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'nvim-lua/plenary.nvim'
Plug 'olical/conjure'
Plug 'phaazon/hop.nvim'
Plug 'raimondi/delimitMate'
Plug 'sickill/vim-pasta'
Plug 'terryma/vim-expand-region'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'ziglang/zig.vim'

call plug#end()

autocmd BufNewFile,BufRead *.zig set ft=zig
autocmd BufNewFile,BufRead *.bb set ft=clojure
autocmd Filetype java setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
colorscheme nord
filetype indent on
filetype on
filetype plugin on
hi Search guibg=yellow guifg=red
set autochdir
set autoindent
set autoread
set autowriteall
set background=dark
set backspace=2
set colorcolumn=100
set completeopt-=preview
set encoding=utf-8
set foldlevel=99
set foldmethod=syntax
set foldnestmax=10
set gdefault
set hlsearch
set ignorecase
set incsearch
set lazyredraw
set modelines=0
set mouse=a
set nobackup
set noswapfile
set nowrap
set nowritebackup
set number
set ruler
set scrolloff=15
set showmatch
set sidescroll=10
set smartcase
set smartindent
set smarttab
set splitright
set switchbuf=usetab
set tabstop=2 expandtab shiftwidth=2 softtabstop=2
set termguicolors
set textwidth=0 wrapmargin=0
set timeoutlen=1000
set ttimeoutlen=10
" set ttimeoutlen=10
" set ttimeoutlen=500
set wildignore+=*.class
set wildignorecase
set wildmenu
set wildmode=list:longest,full
syntax on

imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
inoremap <bar> <bar><bar><ESC>i
map <D-t> :tabnew<CR>
map <D-w> :tabclose<CR>
nmap <Space> :
nmap <silent> <C-c> <C-w>c
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l
nmap <silent> <C-s> <C-w>s
nmap <silent> <C-v> <C-w>v
nmap <silent> <Leader>h :nohl<CR>
nnoremap <C-g> :Rg<Cr>
nnoremap <CR> o<Esc>
nnoremap <S-Enter> O<Esc>
nnoremap <leader>do :windo diffoff<CR>
nnoremap <leader>dt :windo difft<CR>
nnoremap <leader>gd :g//d<CR>
nnoremap <leader>pp :%!jq .<CR>
nnoremap <leader>px :%!tidy -xml -utf8 -q -i<CR>
nnoremap <leader>vd :v//d<CR>
nnoremap <localleader>c :T zig build run<cr>
nnoremap <silent> <S-h> gT
nnoremap <silent> <S-l> gt
nnoremap Q @q
nnoremap ZZ :xa<CR>
nnoremap z<Space> zA
vmap Y "*y

autocmd BufEnter * silent! lcd %:p:h " change current dir to dir of current file
autocmd FocusLost * silent! wa "autosaves all files when window loses focus
autocmd FocusGained * :checktime " Automatically reload changed files

let maplocalleader = ","

" delimitMate
let delimitMate_expand_cr = 1

" Hop.nvim
lua <<EOF
require('hop').setup()
vim.api.nvim_set_keymap('n', 's', "<cmd>lua require'hop'.hint_char2()<cr>", {})
EOF

" incserach.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)"

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" lukas-reineke/indent-blankline.nvim
let g:indent_blankline_enabled = v:false
nnoremap <leader>ig :IndentBlanklineToggle<CR>
"lua <<EOF
"vim.opt.termguicolors = true
"vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
"vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
"vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
"vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
"vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
"vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

"require("indent_blankline").setup {
"    char_highlight_list = {
"        "IndentBlanklineIndent1",
"        "IndentBlanklineIndent2",
"        "IndentBlanklineIndent3",
"        "IndentBlanklineIndent4",
"        "IndentBlanklineIndent5",
"        "IndentBlanklineIndent6",
"    },
"}
"EOF

" lessmess
let g:enable_lessmess_onsave = 1

" vim-expand-region
" map m <Plug>(expand_region_expand)
" map M <Plug>(expand_region_shrink)"
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" vim-fzf
nmap <C-f> :GFiles <CR>
nmap <C-b> :Buffers <CR>
nnoremap <C-p> :call fzf#vim#files('~/projects', {}, 0) <CR>
let g:fzf_layout = { 'down': '~15%' }
let g:fzf_preview_window = ''

" " Deoplete
let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('auto_complete_delay', 0)
" call deoplete#custom#option('auto_refresh_delay', 5)
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" cosco
autocmd FileType java nmap <S-k> <Plug>(cosco-commaOrSemiColon)

" Edit .vimrc
function! EditVimRc()
tabe
:e $MYVIMRC
endfunction
nnoremap <F6> :call EditVimRc()<CR>

" Edit .zshrc
function! EditZshRc()
tabe
:e ~/.zshrc
endfunction
nnoremap <F7> :call EditZshRc()<CR>

let g:zig_fmt_autosave = 0
let g:conjure#debug = v:false
let g:conjure#log#hud#enabled = v:false

" Gitgutter
nmap <leader>gs <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
nmap <leader>gp <Plug>(GitGutterPreviewHunk)

" Goyo.vim
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:conjure#client#clojure#nrepl#refresh#after = 'user/start'
let g:conjure#client#clojure#nrepl#refresh#before = 'user/stop'
