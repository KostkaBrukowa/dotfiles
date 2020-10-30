syntax on
language en_US

set spelllang=en_us,pl
set nospell
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch
"
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

" Style
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" tsserver and complitions
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'nvim-lua/diagnostic-nvim'

" regular plugins
" git management
Plug 'tpope/vim-fugitive'
Plug 'ThePrimeagen/vim-be-good'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree'
" support for syntax highlighting for any language
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-dispatch'
" support prettier/eslint
Plug 'dense-analysis/ale'
Plug 'vim-scripts/argtextobj.vim'
Plug 'preservim/nerdtree'
Plug 'vim-test/vim-test'
" line at the bottom of nvim to diplay info such as git branch, mode etc.n
Plug 'itchyny/lightline.vim'
" a simple function to get current git branch
Plug 'itchyny/vim-gitbranch'
" zen-mode plugin
Plug 'junegunn/goyo.vim' 
" spelling plugin
Plug 'kamykn/spelunker.vim'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" fzf dont know what its doing but probably its nice
Plug 'stsewd/fzf-checkout.vim'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

call plug#end()

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark

let mapleader = " "
let maplocalleader="\<space>"

let g:highlightedyank_highlight_duration = 185

" simple leader mappings
nnoremap <leader>w :wa<CR>

" vim-ReplaceWithRegister
nmap <Leader>r  <Plug>ReplaceWithRegisterOperator
nmap <Leader>rr <Plug>ReplaceWithRegisterLine
"
" telescope
let g:telescope_cache_results = 1
let g:telescope_prime_fuzzy_find  = 1

" LSP
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>

imap <c-space> <Plug>(completion_trigger)
set completeopt=menuone,noinsert
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach, require'diagnostic'.on_attach }

" Some other maps
" √ł is <Option-p>
nnoremap √ł :GFiles<CR>zz
nnoremap :gb :GBranches<CR>
nnoremap :gfa :Git fetch --all<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For >")})<CR>

nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>

" <Alt-l>
noremap Ňā <C-o>
" <Alt-u>
noremap √ļ <C-i>

" colemak hjkl mappings
noremap n j
noremap e k
noremap j e
noremap J E
noremap k n
noremap K N
vnoremap n j
vnoremap e k
vnoremap j e
vnoremap J E
vnoremap k n
vnoremap K N

noremap I $
noremap H ^

nnoremap <C-j> J

noremap N 9j
noremap E 9k

nnoremap Y y$

" mike paste not override the register
vnoremap p "_dP

" change current word with cgn
nnoremap c* *Ncgn

" go to declaration of react component when you are inside one
nnoremap <C-d> G%0wwgd

" move line above or downwords
vnoremap ‚ąÜ J
vnoremap ŇĽ K

nnoremap mm mM
nnoremap `m `M
nnoremap 'm 'M
nnoremap mj mJ
nnoremap `j `J
nnoremap 'j 'J
nnoremap mk mK
nnoremap `k `K
nnoremap 'k 'K
nnoremap mn mN
nnoremap `n `N
nnoremap 'n 'N

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" dont know what it is check how it works
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

let g:argtextobj_pairs="(:),{:},<:>,[:]"

" Ale
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}
" let g:ale_fixers = {
" \   'javascript': ['eslint'],
" \   'typescript': ['eslint'],
" \}
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint', 'tsserver']
let g:ale_fixers.typescript = ['eslint', 'tsserver']

" NERDtree
let NERDTreeQuitOnOpen = 0
let NERDTreeMapOpenExpl = 'q'
let NERDTreeMapActivateNode = 'i'
let NERDTreeMapCloseDir = 'h'

" ¬° is <Alt-1>
map ¬° :NERDTreeFind<CR>
noremap <leader>h <C-w><C-h><CR>
noremap <leader>i <C-w><C-l><CR>
noremap <leader>n <C-w><C-j><CR>
noremap <leader>e <C-w><C-k><CR>

" vim-test
let test#strategy = "dispatch"
let g:lightline = {
      \ 'active': {
      \   'right': [ 
      \             [ 'gitbranch', 'readonly',  'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }


"goyo
let g:goyo_linenr=1
let g:goyo_height='98%'
let g:goyo_width=120

" spelunker
let g:enable_spelunker_vim = 1
let g:spelunker_check_type = 2

nnoremap <C-n> :NextDiagnosticCycle<CR>
