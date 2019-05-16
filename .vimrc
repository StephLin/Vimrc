set nu
set relativenumber

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set tabstop=4
set expandtab
set shiftwidth=4
set encoding=utf-8
set laststatus=2
set autoindent " indent automatically on pressing enter
set background=dark " Fix tmux color error
set backspace=indent,eol,start
set hlsearch
set incsearch
set hidden

set t_Co=256
set completeopt-=preview
set t_ut=

syntax on

" set nocompatible              " be iMproved, required
" filetype off                  " required
" set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')

" Plugs for Vim
Plug 'VundleVim/Vundle.vim' " required
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs'

nmap <tab> :NERDTreeTabsToggle<CR>

let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
" let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let python_highlight_all=1

" Plug 'airblade/vim-gitgutter'
" Plug 'mhinz/vim-signify'
" Plug 'gregsexton/MatchTag'
Plug 'Valloric/MatchTagAlways'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'terryma/vim-multiple-cursors'
Plug 'romainl/vim-cool'

Plug 'posva/vim-vue'

Plug 'liuchengxu/space-vim-dark'
let g:space_vim_dark_background = 233
color space-vim-dark
" set termguicolors
hi Comment cterm=italic
hi Comment guifg=#5C6370 ctermfg=59
hi LineNr ctermbg=NONE guibg=NONE

" AutoComplete
Plug 'Valloric/YouCompleteMe' , { 'do': './install.py --clang-completer --system-libclang' }

let g:ycm_python_binary_path='/usr/bin/python3'
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_key_list_select_completion=["<tab>"]
let g:ycm_key_list_previous_completion=["<S-tab>"]
let g:ycm_show_diagnostics_ui = 0
" let g:ycm_error_symbol = '✗'
" let g:ycm_warning_warning = '⚡'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exe = 'python3'

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:ulti_expand_or_jump_res = 0
let g:user_emmet_leader_key='<C-e>'

" Merge ycm and snippet
function! <SID>ExpandSnippetOrReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

Plug 'jiangmiao/auto-pairs'

" auto pairs
let g:AutoPairsShortcutFastWrap='<C-p>e'
let g:AutoPairsShortcutJump='<C-p>n'

Plug 'mattn/emmet-vim'

Plug 'suan/vim-instant-markdown'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

" Snip
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'w0rp/ale'

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']

let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'python': ['pylint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\}
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline#extensions#ale#enabled = 1

nmap <F3> :ALEFix<CR>
nmap <leader>w :ALENextWrap<CR>
nmap <leader>W :ALEPreviousWrap<CR>

" gtags configs
set cscopetag
set cscopeprg='gtags-cscope'

let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap zi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>

map <C-n> :cn<CR>
map <C-p> :cp<CR>
nnoremap <C-\> :exec("Gtags -r ".expand("<cword>"))<cr>
nnoremap <C-m> :exec("Gtags -s ".expand("<cword>"))<cr>

" multicursor
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<S-D>'
let g:multi_cursor_start_key           = 'g<C-d>'
let g:multi_cursor_select_all_key      = 'g<S-D>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-r>'
let g:multi_cursor_skip_key            = '<c-x>'
let g:multi_cursor_quit_key            = '<Esc>'

nmap <F8> :TagbarToggle<CR><CR>
set tags=tags;

nmap <A-Left> :bprev<CR>
nmap <A-Right> :bnext<CR>

imap <C-Left> <Home>
imap <C-Right> <End>
map <C-Left> <Home>
map <C-Right> <End>

set splitright
nmap <bar> :vnew<CR>
nmap <S-Up> <C-w>-
nmap <S-Down> <C-w>+
nmap <S-Left> <C-w><
nmap <S-Right> <C-w>>

vnoremap // y/<C-R>"<CR>N
nmap <Leader>/ ebvey/<C-R>"<CR>N
nmap <Leader>d ebve
nmap <Leader>D EBvE

let g:colorcolumn = 0
function! SetColorColumn()
    if g:colorcolumn > 0
        set colorcolumn=
        let g:colorcolumn=0
    else
        set colorcolumn=80
        let g:colorcolumn=80
    endif
endfunction

nmap <leader>cc :call SetColorColumn()<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

call plug#end()             " required
filetype plugin indent on     " required
