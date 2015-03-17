set expandtab               " Indentation
set shiftwidth=2
set softtabstop=2
set noswapfile              " No swap files, use version control instead
set number                  " Show line numbers
set foldmethod=syntax       " Folding
set foldcolumn=1            " Folding
set foldlevelstart=20       " Folding
set list
set nocompatible
set t_Co=256
set background=dark
set splitbelow              " Natural feeling window splits
set splitright
set encoding=utf-8
set hidden                  " My preference with using buffers. See `:h hidden` for more details
set shellcmdflag=-ic        " Make vim shell (:!) behave like commandprompt

filetype on
filetype plugin on
filetype indent on
syntax on                   " Colors

exec "set listchars=tab:\uBB-,trail:\uB7,nbsp:~,eol:¬,extends:→,precedes:←"
" Unmap arrow keys
no <down> <Nop> 
no <left> <Nop>
no <up> <Nop>
no <right> <Nop>

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

ino <down> <Nop>
ino <left> <Nop>
ino <up>   <Nop>
ino <right> <Nop>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>p :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"let g:vim_markdown_folding_disbled=1 " Markdown
"let javaScript_fold=1                " Javascript
"let perl_fold=1                      " Perl
"let php_folding=1                    " PHP
"let r_syntax_folding=1               " R
"let ruby_fold=1                      " Ruby
"let sh_fold_enabled=1                " sh
"let vimsyn_foldings='af'             " Vim script
"let xml_syntax_folding=1             " XML

"
" Vundle
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'L9'
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  Plugin 'git://git.wincent.com/command-t.git'
  Plugin 'jelera/vim-javascript-syntax'
  Plugin 'pangloss/vim-javascript'
  Plugin 'nathanaelkane/vim-indent-guides'
  Plugin 'Raimondi/delimitMate'
  Plugin 'kien/ctrlp.vim'
  Plugin 'mileszs/ack.vim'
    let g:ackprg = 'ag --nogroup --nocolor --column'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
    let g:syntastic_check_on_open=1

  Plugin 'bling/vim-airline'
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    " unicode symbols
    let g:airline_powerline_fonts=0
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_section_y=""
    set laststatus=2
    set ttimeoutlen=50
    " ~/.vim/settings/airline.vim
    let g:airline_powerline_fonts=0
    let g:airline_theme='badwolf'
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_section_y = "%{strlen(&ft)?&ft:'none'}"
  Plugin 'flazz/vim-colorschemes'
  Plugin 'chrisbra/csv.vim'
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'Shougo/vimshell.vim'
  Plugin 'sjl/gundo.vim'
  Plugin 'jgdavey/tslime.vim'
  Plugin 'christoomey/vim-tmux-navigator'
  let g:NERDTreeWinPos = "right"
  let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

call vundle#end()

colorscheme railscasts
