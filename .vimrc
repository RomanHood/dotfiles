" Unmap arrow keys
no <down> ddp
no <left> <Nop>
no <up> ddkP
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

" Natural feeling window splits
set splitbelow
set splitright

" Colors
syntax on
set t_Co=256
set background=dark

" My preference with using buffers. See `:h hidden` for more details
set hidden

nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2

" No swap files, use version control instead
set noswapfile

" Fix bad autoindent of pasted text
"set paste

" Show line numbers
set number

set nocompatible              " be iMproved, required
filetype plugin indent on                  " required

" Folding
"set foldmethod=syntax
"set foldcolumn=1
"set foldlevelstart=20

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
  Plugin 'vim-scripts/csv.vim'

call vundle#end()

colorscheme railscasts
