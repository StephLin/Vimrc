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
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins for Vim
Plugin 'VundleVim/Vundle.vim' " required
Plugin 'L9'
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeTabsToggle' }
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'mhinz/vim-signify'
" Plugin 'gregsexton/MatchTag'
Plugin 'Valloric/MatchTagAlways'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'tomasiser/vim-code-dark'
" colorscheme codedark
Plugin 'romainl/vim-cool'

Plugin 'liuchengxu/space-vim-dark'
let g:space_vim_dark_background = 233
color space-vim-dark
" set termguicolors
hi Comment cterm=italic
hi Comment guifg=#5C6370 ctermfg=59
hi LineNr ctermbg=NONE guibg=NONE

" AutoComplete
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'

" Autoformat
Plugin 'Chiel92/vim-autoformat'

" Trace
Plugin 'majutsushi/tagbar.git'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'aceofall/gtags.vim'

" Snip
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Syntax
" Plugin 'scrooloose/syntastic'
" Plugin 'nvie/vim-flake8'

" Custom config
set t_Co=256
set completeopt-=preview
set t_ut=

" auto pairs
let g:AutoPairsShortcutFastWrap='<C-p>e'
let g:AutoPairsShortcutJump='<C-p>n'

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1

" ycm
let g:ycm_python_binary_path='/usr/bin/python3'
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_key_list_select_completion=["<tab>"]
let g:ycm_key_list_previous_completion=["<S-tab>"]

let python_highlight_all=1

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

" Awesome config for NerdTree & AirLine
map <Tab> :NERDTreeToggle<CR>
" nmap <C-Right> :tabn<CR>
" nmap <C-Left> :tabp<CR>
" nmap <C-n> :tabnew<CR>
nmap <C-Left> :bprev<CR>
nmap <C-Right> :bnext<CR>
set splitright
nmap <bar> :vnew<CR>
nmap <S-Up> <C-w>-
nmap <S-Down> <C-w>+
nmap <S-Left> <C-w><
nmap <S-Right> <C-w>>

nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

call vundle#end()             " required
filetype plugin indent on     " required
