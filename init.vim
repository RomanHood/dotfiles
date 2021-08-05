set nocompatible           " Set this first for all further settings
set expandtab              " Insert mode uses spaces for <Tab> key.
set nohlsearch
set noswapfile             " No swap files, use version control instead.
set number                 " Show line numbers
set softtabstop=2          " Number of spaces to use for <Tab> in Insert mode.
set shiftwidth=2           " Number of spaces to use for >> and <<.
set splitbelow             " Natural feeling window splits.
set splitright             " Natural feeling window splits.
set undofile               " Undo changes after closing and reopening a file.
set undodir=$HOME/.vimundodir " Store undo history in a directory.
set wildmenu
set wildmode=list:full

filetype off               " Needed for plugin initialization
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'ervandew/supertab'                " Insert mode completion.
  Plugin 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
  Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plugin 'junegunn/fzf.vim'
  Plugin 'ludovicchabant/vim-gutentags'     " auto tag file management
  Plugin 'gmarik/Vundle.vim'                " Plugin manager, using now.
  Plugin 'tpope/vim-fugitive'               " Git wrapper. :Git {command}.
  Plugin 'tpope/vim-commentary'             " Comment stuff out with gcc.
  Plugin 'tpope/vim-vinegar'                " Directory navigation with netrw.
  Plugin 'jremmen/vim-ripgrep'
  Plugin 'stefandtw/quickfix-reflector.vim'
  Plugin 'tpope/vim-sensible'
  Plugin 'flazz/vim-colorschemes'           " Library of colorschemes.
  Plugin 'Raimondi/delimitMate'             " Insert mode auto-closing (), {}, [], ''.
  Plugin 'alvan/vim-closetag'               " autoclose tags
  Plugin 'tpope/vim-surround'               " surround with things
  Plugin 'pangloss/vim-javascript'          " Javascript syntax, indenting.
  Plugin 'leafgarland/typescript-vim'       " typescript syntax
  Plugin 'vim-ruby/vim-ruby'                " Ruby configuration files.
  Plugin 'cespare/vim-toml'                 " rust config files
  Plugin 'rust-lang/rust.vim'               " rust syntax
  Plugin 'MaxMEllon/vim-jsx-pretty'         " jsx syntax
  Plugin 'martinda/Jenkinsfile-vim-syntax'
call vundle#end()
let g:gutentags_ctags_exclude = ['.git', '.serverless', 'dist', 'package-lock.json', 'build']
let g:rg_command = 'rg --vimgrep -S'
let g:ackprg = 'ag --column'

colorscheme inkpot
filetype indent plugin on
syntax on                   " Colors
autocmd TextChanged,TextChangedI <buffer> silent write
autocmd BufNewFile,BufRead *.ts set filetype=javascript.js " This fixes back ticks not highlighting correctly.
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END
" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')
command! -nargs=0 Jest :call CocAction('runCommand', 'jest.projectTest')
command! -nargs=0 JestCurrent :call CocAction('runCommand', 'jest.fileTest', ['%'])
nno <C-b> :Buffers<CR>
nno <C-f> :Files<CR>
nno <C-p> :GFiles<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>qf  <Plug>(coc-fix-current)
nno <leader>1   :!
nno <leader>a   :Use \F! |
nno <leader>bd  :bp<cr>:bd #<cr>
nno <leader>cl  :oconsole.log()<ESC>i
nno <leader>Cl  :Oconsole.log()<ESC>i
nno <leader>da  :bufdo bd<CR>-
nno <leader>F   :Rg | " leave a space
nno <leader>g   :Git | " leave a space
nno <leader>G   :Git! | " leave a space
nno <leader>gbl :Git blame<CR>
nno <leader>br  :Git branch<CR>
nno <leader>gbr :Git branch<CR>
nno <leader>gc  :Git commit<CR>
nno <leader>ch  :Git checkout | " leave a space
nno <leader>gd  :Gdiff<CR>
nno <leader>ge  :Gedit
nno <leader>gf  :Gfetch
nno <leader>gl  :Git log<CR>
nno <leader>gm  :Gmerge | " leave a speace
nno <leader>gp  :Git push | " leave a space
nno <leader>gr  :Gread
nno <leader>gs  :Git<CR>
nno <leader>gt  :Git tree<CR>
nno <leader>gw  :Gwrite
nno <leader>js  :%!python -m json.tool<CR>
nno <leader>pll :Git pull<CR>
nno <leader>psh :Git push<CR>
nno <leader>v   gg V G
nno ; :

nno <leader>s   :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>
nnoremap <leader>tf :JestCurrent<CR>
nnoremap <leader>tr :Jest<CR>
nno <C-H>       <C-W><C-H>
nno <NL>        <C-W><NL>
nno <C-K>       <C-W><C-K>
nno <C-L>       <C-W><C-L>
