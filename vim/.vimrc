" Plug setup
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin list
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'typescript.tsx']} " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'jamestthompson3/vim-jest'
Plug 'tpope/vim-fugitive'
Plug 'moll/vim-bbye'
Plug 'miyakogi/conoline.vim'
Plug 'w0rp/ale'
call plug#end()

" General Settings
syntax on
filetype plugin indent on

set termguicolors
set nobackup
set nowritebackup
set noswapfile
set smartcase
set hidden
set showmatch
set lazyredraw
set clipboard=unnamedplus
set hlsearch
set incsearch

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set norelativenumber 
:  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber 
:augroup END
set number
"autocmd VimLeave * !rm *:p
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set splitbelow
set splitright

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
let mapleader = ","

" Display matching files on tab complete
set wildmenu

" Show Invisibles
set list
set listchars=tab:→→

" Treat all numbers as decimal regardless of whether they are padded with zeros
set nrformats=

" Other Settings
" COC
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <Leader>K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" FZF
let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>b :FzfBuffers<CR>
nnoremap <Leader>h :FzfHistory<CR>
nnoremap <Leader>t :FzfBTags<CR>
nnoremap <Leader>T :FzfTags<CR>
nnoremap <C-p> :FzfFiles<CR>
" Have FZF list all tracked files plus untracked files minus your ignored files
nnoremap <Leader>p :FzfGitFiles --exclude-standard --others --cached<CR>
nnoremap <Leader>gt :FzfRg<CR>

" RIPGREP
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree
" Show hidden files/directories
let g:NERDTreeShowHidden = 1

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1

" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^\.eslintrc.json$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" Switching tabs quickly
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

nnoremap <C-left> :tabprevious<CR>
nnoremap <C-right> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

" Save state of open Windows and Buffers
nnoremap <leader>s :mksession<CR>

" Delete buffer completely without messing up window layout
nnoremap <leader>q :Bwipeout<CR>

" Create file under cursor
:map <leader>gf :e <cfile><cr>

" ALE
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fixers['typescript'] = ['prettier', 'tslint']
let g:ale_fixers['typescriptreact'] = ['prettier', 'tslint']
let g:ale_fixers['typescript.tsx'] = ['prettier', 'tslint']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['php'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['html'] = ['prettier']
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_linters['typescript'] = ['tslint', 'eslint']
let g:ale_linters['typescriptreact'] = ['tslint', 'eslint']
let g:ale_linters['typescript.tsx'] = ['tslint', 'eslint']
let g:ale_linters['php'] = ['phpcs', 'phpstan']
let g:ale_fix_on_save = 1 " Fix files automatically on save
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}
let g:ale_set_highlights = 1 
let g:ale_lint_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEError ctermbg=none cterm=underline
"highlight ALEErrorSign ctermbg=NONE ctermfg=red
"highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
nnoremap <leader>le :ALEDetail<CR>

" Move between linting errors
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)

nmap <F6> <Plug>(ale_fix)


" GRUVBOX
set background=dark
let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_invert_selection = 0
let g:gruvbox_plugin_hi_groups = 1
let g:gruvbox_italicize_strings = 1
colorscheme gruvbox

set laststatus=2
" Lightline
set t_Co=256

" Integrate Coc with Lightline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

set backspace=indent,eol,start
