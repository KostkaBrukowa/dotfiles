syntax on
language en_US

filetype plugin on

set wrap
set spelllang=en_us,pl
set spell
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
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
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Style
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Valloric/YouCompleteMe'

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
Plug 'SirVer/ultisnips'


" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" fzf dont know what its doing but probably its nice
Plug 'stsewd/fzf-checkout.vim'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

Plug 'lervag/vimtex'

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
imap <c-space> <Plug>(completion_trigger)

" Some other maps
" √ł is <Option-p>
nnoremap √ł :GFiles<CR>
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
noremap n gj
noremap e gk
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
\   'latex': ['lacheck'],
\}
" let g:ale_fixers = {
" \   'javascript': ['eslint'],
" \   'typescript': ['eslint'],
" \}
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']
let g:ale_fixers.typescript = ['eslint']

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

let g:tex_flavor = 'latex'
nnoremap <space>b :VimtexCompile<CR>
nnoremap <space>i :VimtexTocToggle<CR>
nnoremap <space>p :VimtexView<CR> 
nnoremap <space>c :VimtexCountWords<CR> 

let g:latex_view_general_viewer = 'skim'
let g:vimtex_view_method = 'skim'
let g:vimtex_quickfix_mode=0

let g:UltiSnipsSnippetsDir="/Users/jaroslaw.glegola/snips"
let g:UltiSnipsSnippetDirectories = ['snips']


let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-vimtex',
  \ 'coc-explorer',
  \ 'coc-vimlsp',
  \ ]

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


