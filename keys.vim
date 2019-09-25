" Change leader key from \ to ,
let mapleader = ","

" Disable F1 bringing up the help doc every time
"autocmd FileType netrw setlocal bufhidden=delete
"inoremap <F1> <ESC>
"nnoremap <F1> <ESC>
"vnoremap <F1> <ESC>

nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

" A saner way to save files.<F2> is easy to press
nnoremap <F2> :w<CR>

inoremap <S-Tab> <C-d>

" MOVING LINES
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" QuickFix List
nnoremap <leader>co :cw<CR>
nnoremap <leader>cc :ccl<CR>
nnoremap <S-UP> :cope<CR>
nnoremap <S-DOWN> :cclose<CR>
nnoremap <S-LEFT> :cprev<CR>
nnoremap <S-RIGHT> :cnext<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cprev<CR>

" console for linting error under cursor with ale
nnoremap <leader>le :ALEDetail<CR>

" Search for pattern
" nnoremap <leader>g :Rg<CR>

" Shortcut to open init.vim
nnoremap <leader>ev :vsp $MYVIMRC<CR>

" Save state of open Windows and Buffers
nnoremap <leader>s :mksession<CR>

" Delete buffer completely without messing up window layout
nnoremap <leader>q :Bwipeout<CR>

" turn off search highlights
nnoremap <leader><space> :nohlsearch<CR>

" Reload Vim config
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>

" Create file under cursor
:map <leader>gf :e <cfile><cr>

" === Nerdtree shorcuts === "
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
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
