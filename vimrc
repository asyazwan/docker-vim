if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'raimondi/delimitmate'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/syntastic'
Plug 'thaerkh/vim-indentguides'
Plug '~/.vim/.fzf'
Plug 'junegunn/fzf.vim'

Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }


Plug 'ryanoasis/vim-devicons'
call plug#end()


set backupdir=~/.vim/backups
set undofile
set undodir=~/.vim/undo

set shell=fish
syntax on
set tabstop=2
set expandtab
set shiftwidth=2
set nu
set backspace=2
"If enabled then it's hard to select text to copy into OSX clipboard
set mouse=a

let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
set guifont=Iconsolata\ for\ Powerline:h10

"Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"Close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_theme='bubblegum'

" Don't mess up windows when closing buffer with NERDTree open
nnoremap <leader>q :bp\|bd #<cr>

au FileType gitcommit
 \ hi gitcommitSummary ctermfg=yellow ctermbg=red

nnoremap <c-\> :NERDTreeToggle<CR>

set statusline+=%#warningmsg#
if !has('nvim')
  set statusline+=%{SyntasticStatuslineFlag()}
endif
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

nnoremap <leader>s :ToggleWorkspace<CR>

" disable autosave
let g:workspace_autosave = 0
let g:workspace_autosave_always = 0

" make it possible to switch buffer without saving current buffer
set hidden
set listchars="tab:| ,trail:·"

set paste

" Convenient shortcuts
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :BCommits<CR>
nnoremap <leader>F :Files<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>L :Lines<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>w :NERDTreeFind<CR>
nnoremap <leader>i :IndentGuidesToggle<CR>

