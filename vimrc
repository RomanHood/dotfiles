set nocompatible           " Set this first for all further settings

function! MyFoldText()
  let nl = v:foldend - v:foldstart + 1
  let txt = getline(v:foldstart) . ': ' . nl . ' lines'
  return txt
endfunction

set background=dark        " Use colors good for a dark bg. Does NOT set bg clr.
set encoding=utf-8         " Set character encoding used in Vim.
set expandtab              " Insert mode uses spaces for <Tab> key.
set fillchars="fold: "     " Fill fold lines with empty spaces.
set foldtext=MyFoldText()  " Show beginning text followed by fold length.
set foldmethod=syntax      " Find folds based on filetype syntax.
set foldlevelstart=1       " Default fold level, folds 1 level deep are closed
set laststatus=2           " Every pane has a status line.
set list                   " Turn on listchars, symbolize certain characters.
set noswapfile             " No swap files, use version control instead.
set nowrap                 " Don't wrap long lines, scroll off screen instead.
set number                 " Show line numbers.
set shellcmdflag=-c        " Make vim shell (:!) behave like commandprompt.
set shiftwidth=2           " Number of spaces to use for >> and <<.
set splitbelow             " Natural feeling window splits.
set splitright             " Natural feeling window splits.
set softtabstop=2          " Number of spaces to use for <Tab> in Insert mode.
set timeoutlen=400         " Number of milliseconds to resolve key mappings.
set t_Co=256               " Number of colors.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*

exec "set listchars=tab:\uBB-,trail:\uB7,nbsp:~,eol:¬,extends:→,precedes:←"

filetype off               " Needed for plugin initialization
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'chrisbra/csv.vim'
  Plugin 'christoomey/vim-tmux-navigator'   " Vim and tmux pane navigation.
  Plugin 'ervandew/supertab'                " Insert mode completion.
  Plugin 'flazz/vim-colorschemes'           " Library of colorschemes.
  Plugin 'garbas/vim-snipmate'              " Snippet engine for vim-snippets.
  Plugin 'gmarik/Vundle.vim'                " Plugin manager, using now.
  Plugin 'honza/vim-snippets'               " Snippet files uses, vim-snipmate.
  Plugin 'jelera/vim-javascript-syntax'     " Enhanced sytax for javascript.
  Plugin 'jgdavey/tslime.vim'               " Send text from buffer to tmux session.
  Plugin 'justinmk/vim-syntax-extra'        " Enhanced sytax definitions for C.
  Plugin 'kchmck/vim-coffee-script'         " CS syntax, indenting, compiling.
  Plugin 'kien/ctrlp.vim'                   " File fuzzyfinder.
  Plugin 'L9'                               " General utility functions.
  Plugin 'MarcWeber/vim-addon-mw-utils'     " Dependency of vim-snipmate.
  Plugin 'mileszs/ack.vim'                  " The Silver Searcher / ag.
  Plugin 'mustache/vim-mustache-handlebars' " Mustache/hbs syntax & abbrevs.
  Plugin 'nathanaelkane/vim-indent-guides'  " Highlight indented column space.
  Plugin 'pangloss/vim-javascript'          " Javascript syntax, indenting.
  Plugin 'Raimondi/delimitMate'             " Insert mode auto-closing quotes, parens, brackets.
  Plugin 'scrooloose/nerdtree'              " Visual file navigation.
  " Plugin 'scrooloose/syntastic'             " Syntax checker, displays errors.
  Plugin 'Shougo/vimproc.vim'
  " Plugin 'Shougo/vimshell.vim'            " Interactive shell in a buffer.
  " Plugin 'sjl/gundo.vim'                  " Visualize undo history.
  Plugin 'terryma/vim-multiple-cursors'     " Sublime-style multiple selection.
  Plugin 'thoughtbot/vim-rspec'             " Rspec runner. RunLastSpec(), RunNearestSpec(), etc.
  Plugin 'tomtom/tlib_vim'                  " Utility functions.
  Plugin 'tpope/vim-bundler'                " Bundler wrapper. :Bundle {command}.
  Plugin 'tpope/vim-endwise'                " Auto-closing of ruby blocks.
  Plugin 'tpope/vim-fugitive'               " Git wrapper. :Git {command}.
  Plugin 'tpope/vim-commentary'             " Comment stuff out with gcc.
  Plugin 'tpope/vim-rails'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'vim-utils/vim-man'
  Plugin 'vim-ruby/vim-ruby'                " Ruby configuration files.
call vundle#end()

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
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
let g:airline#extensions#branch#displayed_head_limit = 50
let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden=1
let g:ctrlp_show_hidden=1
let g:ackprg = 'ag --column'
let g:syntastic_check_on_open=1
let g:mustache_abbreviations = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let &colorcolumn=81

filetype indent plugin on
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
nno <leader>a   :Ack | " leave a space
nno <leader>b   obinding.pry<ESC>
nno <leader>B   Obinding.pry<ESC>
nno <leader>bf  :bfirst<CR>
nno <leader>bl  :blast<CR>
nno <leader>bd  :bp<cr>:bd #<cr>
nno <leader>bi  :!bundle install<CR>
nno <leader>bo  :Bvsplit | " leave a space
nno <leader>bu  :!bundle update<CR>
nno <leader>cd  :cd
nno <leader>ch  :Git checkout | " leave a space
nno <leader>fi  mzgg=G'z
nno <leader>g   :Git | " leave a space
nno <leader>G   :Git! | " leave a space
nno <leader>gbl :Gblame<CR>
nno <leader>gbr :Git branch<CR>
nno <leader>gc  :Gcommit<CR>
nno <leader>gd  :Gdiff<CR>
nno <leader>gf  :Gfetch<CR>
nno <leader>gl  :Git log<CR>
nno <leader>gm  :Gmerge  | " leave a speace
nno <leader>gp  :Git push | " leave a space
nno <leader>gs  :Gstatus<CR>
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
