set paste
set nocompatible
set laststatus=2
set ttimeoutlen=50
set expandtab               " Indentation
set shiftwidth=2
set softtabstop=2
set noswapfile              " No swap files, use version control instead
set number                  " Show line numbers

set foldmethod=syntax       " Folding
set foldlevelstart=1        " Folding
function! MyFoldText()
    let nl = v:foldend - v:foldstart + 1
    let txt = getline(v:foldstart) . ': ' . nl . ' lines'
    return txt
endfunction
" let g:vim_markdown_folding_disbled=1 " Markdown
" let javaScript_fold=1                " Javascript
" let perl_fold=1                      " Perl
" let php_folding=1                    " PHP
" let r_syntax_folding=1               " R
" let ruby_fold=1                      " Ruby
" let sh_fold_enabled=1                " sh
" let vimsyn_foldings='af'             " Vim script
" let xml_syntax_folding=1             " XML
" let &colorcolumn=join(range(81,999),",")
set foldtext=MyFoldText()
set fillchars="fold: "
set list
set t_Co=256
set background=dark
set splitbelow              " Natural feeling window splits
set splitright
set encoding=utf-8
" set hidden                  " My preference with using buffers. See `:h hidden` for more details
set shellcmdflag=-c         " Make vim shell (:!) behave like commandprompt
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/* 

exec "set listchars=tab:\uBB-,trail:\uB7,nbsp:~,eol:¬,extends:→,precedes:←"
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'tpope/vim-fugitive'
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
  Plugin 'Shougo/vimshell.vim'
  Plugin 'sjl/gundo.vim'
  Plugin 'jgdavey/tslime.vim'
  Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'justinmk/vim-syntax-extra'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'mustache/vim-mustache-handlebars'
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
let g:airline_theme='badwolf'
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

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>vs :e ~/dotfiles/vimrc<CR>
nnoremap <leader>1 :!
nnoremap ; :
nnoremap <leader>cd :cd 
nnoremap <leader>p :pwd<CR>
nnoremap <leader>] :NERDTree<CR>
nnoremap <leader>b obinding.pry<ESC>
nnoremap <leader>B Obinding.pry<ESC>
nnoremap <leader>TS :%s/\s\+$//<CR>
nnoremap <leader>fi mzgg=G'z
nnoremap <leader>r :w !sudo tee % <CR> " save the files using sudo
nnoremap <leader>bd :bp<cr>:bd #<cr>
nnoremap <leader>v gg V G
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==
"
"inoremap <C-j> <Esc>:m .+1<CR>==gi
"inoremap <C-k> <Esc>:m .-2<CR>==gi
"
"vnoremap <C-j> :m '>+1<CR>gv=gv
"vnoremap <C-k> :m '<-2<CR>gv=gv

nno <leader>l :bnext<CR>
nno <leader>h :bprevious<CR>
nno <leader>st :Gstatus<CR>
nno <leader>di :Gdiff<CR>
nno <leader>bl :Gblame<CR>
nno <leader>g :Git 
nno <leader>a :Ack 
nno <leader>s :source ~/.vimrc<CR>

colorscheme inkpot
