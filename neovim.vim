set clipboard+=unnamedplus  " use the clipboards of vim and win
"set paste               " Paste from a windows or from vim
set go+=a               " Visual selection automatically copied to the clipboard

set tw=79              " set the tab width
set whichwrap+=<,>,h,l

set nocp
filetype off     
colorscheme darkblue
set nu
set autoindent
set nrformats=
syntax on
set encoding=utf-8 "use utf-8 encoding
filetype plugin indent on
set tabstop=4
set shiftwidth=4
" On pressing tab, insert 4 spaces
set mouse=a
" spaces instead of tabs
set expandtab
" dark terminal
set background=dark
"
call plug#begin()
 Plug 'scrooloose/nerdtree' "File tree
 Plug '907th/vim-auto-save' "Auto save plugin
 Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins'} "Python syntax highlighting
 Plug 'rust-lang/rust.vim'
 Plug 'Yggdroot/indentLine'
 Plug 'tpope/vim-commentary'
 Plug 'dinhhuy258/vim-local-history', {'branch': 'master', 'do': ':UpdateRemotePlugins'}
 Plug 'Vimjas/vim-python-pep8-indent'
 Plug 'github/copilot.vim'
 Plug 'christoomey/vim-tmux-navigator'
call plug#end()
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Hybrid mode for line numbers
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END
" 
nnoremap ; :
" 
" Convinient exit from insert mode
imap fj <esc>
imap jf <esc>

set wildmenu
set wildmode=full
nnoremap <F5> :LocalHistoryToggle<CR>
" use system clipboard
" https://anuragpeshne.github.io/essays/vim/7.html
" noremap y "*y
" noremap yy "*yy
" noremap Y "*y$
" noremap x "*x
" noremap dd "*dd
" noremap D "*D
