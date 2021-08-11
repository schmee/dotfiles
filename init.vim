set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
set rtp+=/usr/local/opt/fzf

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Shougo/deoplete.nvim'
Plugin 'airblade/vim-gitgutter'
Plugin 'arcticicestudio/nord-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'eraserhd/parinfer-rust'
Plugin 'hashivim/vim-terraform'
Plugin 'haya14busa/incsearch.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'kassio/neoterm'
Plugin 'lfilho/cosco.vim'
Plugin 'olical/conjure'
Plugin 'mboughaba/vim-lessmess'
Plugin 'mhinz/vim-startify'
Plugin 'mtth/scratch.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'raimondi/delimitMate'
Plugin 'terryma/vim-expand-region'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'ziglang/zig.vim'

call vundle#end()
filetype plugin indent on

autocmd BufNewFile,BufRead *.zig set ft=zig
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
set encoding=utf-8
set foldlevel=99
set foldmethod=syntax
set foldnestmax=10
set gdefault
set guifont=Menlo:h12
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
nnoremap <silent> <S-h> gT
nnoremap <silent> <S-l> gt
nnoremap Q @q
nnoremap ZZ :xa<CR>
nnoremap z<Space> zA

autocmd BufEnter * silent! lcd %:p:h " change current dir to dir of current file
autocmd FocusLost * silent! wa "autosaves all files when window loses focus
autocmd FocusGained * :checktime " Automatically reload changed files

let maplocalleader = ","

" delimitMate
let delimitMate_expand_cr = 1

" Easy-motion
let g:EasyMotion_smartcase = 1
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)
vmap s <Plug>(easymotion-s2)
nmap <Leader>s <Plug>(easymotion-sl2)
" nmap L <Plug>(easymotion-f)
" vmap L <Plug>(easymotion-f)
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ASDFGHJKLQWERTYUIOPZXCVBNM;'

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

" Indent guides
let g:indent_guides_guide_size = 1

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

let g:zig_fmt_autosave = 0
