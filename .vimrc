set nu
set tabstop=4
set expandtab
set shiftwidth=4
set encoding=utf-8
set laststatus=2
set autoindent " indent automatically on pressing enter

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins for Vim
Plugin 'VundleVim/Vundle.vim' " required
Plugin 'L9'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'mhinz/vim-signify'
Plugin 'gregsexton/MatchTag'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'octol/vim-cpp-enhanced-highlight'

" AutoComplete
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'Raimondi/delimitMate'

" Track the engine.
Plugin 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Syntax
" Plugin 'scrooloose/syntastic'
" Plugin 'nvie/vim-flake8'

" Custom config
set t_Co=256
set completeopt-=preview

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
let g:ycm_python_binary_path='/usr/bin/python3'
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let python_highlight_all=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exe = 'python3'
let g:ycm_key_list_select_completion=["<tab>"]
let g:ycm_key_list_previous_completion=["<S-tab>"]

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res = 0

function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

" Awesome config for NerdTree & AirLine
map <Tab> :NERDTreeToggle<CR>
nmap <C-Right> :tabn<CR>
nmap <C-Left> :tabp<CR>
nmap <C-n> :tabnew<CR>
map <C-Up> :bprev<CR>
map <C-Down> :bnext<CR>
nmap <S-Up> <C-w>-
nmap <S-Down> <C-w>+
nmap <S-Left> <C-w><
nmap <S-Right> <C-w>>

call vundle#end()             " required
filetype plugin indent on     " required
