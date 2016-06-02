function! MyFoldText()
    let nl = v:foldend - v:foldstart + 1
    let txt = getline(v:foldstart) . ': ' . nl . ' lines'
    return txt
endfunction

set background=dark
set encoding=utf-8
set expandtab               " Indentation
set fillchars="fold: "
set foldtext=MyFoldText()
set foldmethod=syntax       " Folding
set foldlevelstart=1        " Folding
set laststatus=2
set list
set paste
set nocompatible
set noswapfile              " No swap files, use version control instead
set nowrap
set number                  " Show line numbers
set rtp+=~/.vim/snippets/
set shellcmdflag=-c         " Make vim shell (:!) behave like commandprompt
set shiftwidth=2
set splitbelow              " Natural feeling window splits
set splitright
set softtabstop=2
set ttimeoutlen=50
set t_Co=256
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/* 

exec "set listchars=tab:\uBB-,trail:\uB7,nbsp:~,eol:¬,extends:→,precedes:←"

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-bundler'
  Plugin 'vim-utils/vim-man'
  Plugin 'tpope/vim-commentary'
  Plugin 'tpope/vim-rails'
  Plugin 'L9'
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  Plugin 'git://git.wincent.com/command-t.git'
  Plugin 'jelera/vim-javascript-syntax'
  Plugin 'pangloss/vim-javascript'
  Plugin 'nathanaelkane/vim-indent-guides'
  Plugin 'Raimondi/delimitMate'
  Plugin 'kien/ctrlp.vim'
  Plugin 'mileszs/ack.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'bling/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'flazz/vim-colorschemes'
  Plugin 'chrisbra/csv.vim'
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'Shougo/vimproc.vim'
  Plugin 'Shougo/vimshell.vim'
  Plugin 'sjl/gundo.vim'
  Plugin 'jgdavey/tslime.vim'
  Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'justinmk/vim-syntax-extra'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'mustache/vim-mustache-handlebars'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'ervandew/supertab'
  Plugin 'tpope/vim-endwise'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'
  Plugin 'honza/vim-snippets'
call vundle#end()

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_section_y=""
let g:airline_powerline_fonts=0
let g:airline_theme='jellybeans'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_y = "%{strlen(&ft)?&ft:'none'}"
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1
let g:ctrlp_show_hidden=1
let g:ackprg = 'ag --column'
let g:syntastic_check_on_open=1
let g:mustache_abbreviations = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let &colorcolumn=81

filetype on
filetype plugin on
filetype indent on
syntax on                   " Colors

" Unmap arrow keys
no <down> <Nop>
no <left> <Nop>
no <up> <Nop>
no <right> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <up>   <Nop>
ino <right> <Nop>

nno ; :
nno <C-J> <C-W><C-J> " Split navigation
nno <C-K> <C-W><C-K> " Split navigation
nno <C-L> <C-W><C-L> " Split navigation
nno <C-H> <C-W><C-H> " Split navigation
nno <leader>a   :Ack | "Do stuff
nno <leader>b   obinding.pry<ESC>
nno <leader>B   Obinding.pry<ESC>
nno <leader>bd  :bp<cr>:bd #<cr>
nno <leader>bi  :Bundle install<CR>
nno <leader>bl  :Gblame<CR>
nno <leader>bo  :Bvsplit | "leave a space
nno <leader>bu  :Bundle update<CR>
nno <leader>cd  :cd
nno <leader>fi  mzgg=G'z
nno <leader>g   :Git | "leave a space
nno <leader>G   :Git! | "leave a space
nno <leader>gbr :Git branch<CR>
nno <leader>gc  :Gcommit<CR>
nno <leader>gd  :Gdiff<CR>
nno <leader>gs  :Gstatus<CR>
nno <leader>gl  :Glog<CR>
nno <leader>gp  :Git push | "leave a space
nno <leader>gt  :Git tree<CR>
nno <leader>h   :bprevious<CR>
nno <leader>l   :bnext<CR>
nno <leader>p   :pwd<CR>
nno <leader>pll :Gpull<CR>
nno <leader>psh :Gpush<CR>
nno <leader>r   :w !sudo tee % <CR> " save the files using sudo
nno <leader>s   :source ~/.vimrc<CR>
nno <leader>TS  :%s/\s\+$//<CR>
nno <leader>v   gg V G
nno <leader>vs  :e ~/dotfiles/vimrc<CR>
nno <leader>1   :!
nno <leader>]   :NERDTree<CR>

" colorscheme candycode
" colorscheme mophiaDark
colorscheme inkpot
hi Folded ctermfg=red
hi Folded ctermbg=black
