" vim-polygot
let g:polyglot_disabled = ['css']

" #GRUVBOX {{{
set background=dark
let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_invert_selection = 0
let g:gruvbox_plugin_hi_groups = 1
colorscheme gruvbox
" }}}

" #SUPERTAB {{{
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabClosePreviewOnPopupClose = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<C-x><C-o>"
" }}}

" #Lightline {{{
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
" }}}

" #EMMET {{{
let g:user_emmet_expandabbr_key='<C-@>'
imap <expr> <C-Space> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
"}}}

" #COC {{{
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
" }}}

" #MARKDOWN {{{
let g:pencil#textwidth = 80
let g:vim_markdown_folding_disabled = 1
au BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
let g:markdown_fenced_languages = ['rust', 'css', 'yaml', 'javascript', 'html', 'vim','json']
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init({'wrap': 'soft'})
augroup END
"}}}

" #ALE {{{
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {'typescript': ['prettier', 'tslint']}
let g:ale_linters = {'typescript': ['tslint']}

let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['scss'] = ['stylelint']
let g:ale_fixers['rust'] = ['rustfmt']
let g:ale_fix_on_save = 1 " Fix files automatically on save
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}
let g:ale_lint_on_save = 1
let g:ale_sign_error = '🔴'
let g:ale_sign_warning = '🔸'

" Move between linting errors
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)

nmap <F6> <Plug>(ale_fix)
"}}}

" #ULTILSNIPS {{{
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.config/nvim/snips"
let g:UltiSnipsSnippetDirectories=["UtilSnips", "snips"]
"}}}


" #NETRW {{{
" Set preferred view
"let g:netrw_liststyle = 3
" Remove banner
"let g:netrw_banner = 0
" Hide certain files and directories
" let g:netrw_list_hide= netrw_gitignore#Hide().'.*\.DS_Store$'
" let g:netrw_list_hide = '.*\.DS_Store$'
" let g:netrw_hide = 1
" }}}

" #FZF {{{
let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>b :FzfBuffers<CR>
nnoremap <Leader>h :FzfHistory<CR>
nnoremap <Leader>t :FzfBTags<CR>
nnoremap <Leader>T :FzfTags<CR>
nnoremap <C-p> :FzfFiles<CR>
" Have FZF list all tracked files plus untracked files minus your ignored files
nnoremap <Leader>p :FzfGitFiles --exclude-standard --others --cached<CR>
nnoremap <Leader>gt :FzfRg<CR>
" }}}

" #RIPGREP {{{
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" }}}

" #CONOLINE {{{
" Highlight the line of the cursor
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_insert=1
" }}}

" #VIM GO {{{
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" Automatically import packages on save
let g:go_fmt_command = "goimports"

" Prevent errors from opening the location list
let g:go_fmt_fail_silently = 1

" Search and easily navigate between the function and type definitions within
" the package
au FileType go nmap <leader>d :GoDeclsDir<cr>

" Go to definition
au FileType go nmap <F5> <Plug>(go-def)

" Go Fmt
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
" }}}

" #GUTENTAGS {{{
let g:gutentags_file_list_command = "rg --files --follow --ignore-file '/home/kevin/.vimignore'"
let g:gutentags_ctags_tagfile = "/home/kevin/tmp"
" }}}

" #SIGNIFY {{{
" Check for only Git
let g:signify_vcs_list = [ 'git' ]

" Jump to next and previous hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" Hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
" }}}

" #FUGITIVE {{{
nmap <leader>gw :Gwrite<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gs :Gstatus<CR>
" }}}

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" === NERDTree === "
" Show hidden files/directories
let g:NERDTreeShowHidden = 1

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1

" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^\.eslintrc.json$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

autocmd FileType typescript JsPreTmpl
autocmd FileType typescript syn clear foldBraces

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'yarn add lint --'
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
