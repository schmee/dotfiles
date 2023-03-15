set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
set rtp+=/usr/local/opt/fzf

filetype plugin indent on
call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.0.0'}
Plug 'lewis6991/gitsigns.nvim'
Plug 'lfilho/cosco.vim'
Plug 'kassio/neoterm'
Plug 'mboughaba/vim-lessmess'
Plug 'mhartington/oceanic-next'
Plug 'mhinz/vim-startify'
Plug 'mtth/scratch.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'olical/conjure'
Plug 'PeterRincker/vim-argumentative'
Plug 'raimondi/delimitMate'
Plug 'sickill/vim-pasta'
Plug 'svermeulen/vim-subversive'
Plug 'terryma/vim-expand-region'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'ziglang/zig.vim'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'romgrk/github-light.vim'

call plug#end()

lua <<EOF
require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = false },
    keywords = { italic = false },
  },
  dim_inactive = false, -- dims inactive windows
})
EOF

autocmd BufNewFile,BufRead *.zig set ft=zig
autocmd BufNewFile,BufRead *.bb set ft=clojure
autocmd Filetype java setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
colorscheme tokyonight
filetype indent on
filetype on
filetype plugin on
hi Search guibg=yellow guifg=red
set autochdir
set autoindent
set autoread
set autowrite
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
set nofixeol
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
nnoremap <silent> <S-h> gT
nnoremap <silent> <S-l> gt
nnoremap Q @q
nnoremap ZZ :xa<CR>
nnoremap z<Space> zA
vmap Y "*y

autocmd BufEnter * silent! lcd %:p:h " change current dir to dir of current file
autocmd FocusLost * silent! wa "autosaves all files when window loses focus
autocmd FocusGained * :checktime " Automatically reload changed files
autocmd BufLeave,InsertLeave * silent! w " Automatically save

let maplocalleader = ","

" delimitMate
let delimitMate_expand_cr = 1

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

" lessmess
let g:enable_lessmess_onsave = 1

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" vim-fzf
nmap <C-f> :GFiles <CR>
nmap <C-b> :Buffers <CR>
nmap <localleader>j :Lines <CR>
nmap <localleader>l :BLines <CR>
nnoremap <C-p> :call fzf#vim#files('~/projects', {}, 0) <CR>
let g:fzf_layout = { 'window': { 'relative': v:true, 'width': 0.9, 'height': 0.3 } }
let g:fzf_preview_window = ''

" " Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete_delay', 0)
call deoplete#custom#option('auto_refresh_delay', 5)
call deoplete#custom#source('_', 'smart_case', v:true)
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" cosco
autocmd FileType java nmap <S-k> <Plug>(cosco-commaOrSemiColon)
autocmd FileType zig nmap <S-k> <Plug>(cosco-commaOrSemiColon)

" neoterm
let g:neoterm_auto_repl_cmd = 0
let g:neoterm_autoscroll = 1
let g:neoterm_default_mod = 'vertical'
nnoremap <localleader>b :T zig build test<cr>
" nnoremap <localleader>c :T zig build run<cr>
" nnoremap <localleader>c :T zig build run<cr>
nnoremap <localleader>c :Tkill <bar> T zig build run<cr>
nnoremap <localleader>x :T !!<cr>
nnoremap <localleader>t :Topen<cr>
nnoremap <localleader>v :Tclear<cr>

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

" Goyo.vim
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" vim-pasta
let g:pasta_disabled_filetypes = ['clj', 'clojure']
let g:pasta_enabled_filetypes = ['zig']

let g:conjure#client#clojure#nrepl#refresh#after = 'user/start'
let g:conjure#client#clojure#nrepl#refresh#before = 'user/stop'

" nmap <localleader>c :ConjureEvalBuf<CR>
nmap <localleader>m <localleader>emm
"
nmap s <plug>(SubversiveSubstitute)
nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)

" vim-asterisk
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)

lua <<EOF
require('gitsigns').setup {
  attach_to_untracked = false,
  signs = {
      add = {text = '+'},
      change = {text = '~', show_count = true},
      delete = {show_count = true},
      changedelete = {hl = 'GitSignsDelete', text = '~', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn', show_count = true},
  },
  keymaps = {
      ['n <leader>ga'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['n <leader>gu'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['n <leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <leader>gn'] = '<cmd>lua require"gitsigns".next_hunk()<CR>',
  },
}
EOF

lua <<EOF
require("luasnip.loaders.from_snipmate").load({ paths = "/Users/johnschmidt/.vim/snippets"} )
EOF

imap <silent><expr> <C-l> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
imap <silent> <C-j> <cmd>lua require'luasnip'.jump(-1)<Cr>
