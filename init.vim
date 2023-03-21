set nocompatible           " Set this first for all further settings
set expandtab              " Insert mode uses spaces for <Tab> key.
set mouse=nv
set nohlsearch
set noswapfile             " No swap files, use version control instead.
set nowrap
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
call plug#begin()
  Plug 'ervandew/supertab'                " Insert mode completion.
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'ludovicchabant/vim-gutentags'     " auto tag file management
  Plug 'gmarik/Vundle.vim'                " Plugin manager, using now.
  Plug 'tpope/vim-fugitive'               " Git wrapper. :Git {command}.
  Plug 'tpope/vim-commentary'             " Comment stuff out with gcc.
  Plug 'tpope/vim-vinegar'                " Directory navigation with netrw.
  Plug 'jremmen/vim-ripgrep'
  Plug 'stefandtw/quickfix-reflector.vim'
  Plug 'tpope/vim-sensible'
  Plug 'flazz/vim-colorschemes'           " Library of colorschemes.
  Plug 'Raimondi/delimitMate'             " Insert mode auto-closing (), {}, [], ''.
  Plug 'alvan/vim-closetag'               " autoclose tags
  Plug 'tpope/vim-surround'               " surround with things
  Plug 'pangloss/vim-javascript'          " Javascript syntax, indenting.
  Plug 'leafgarland/typescript-vim'       " typescript syntax
  Plug 'vim-ruby/vim-ruby'                " Ruby configuration files.
  Plug 'cespare/vim-toml'                 " rust config files
  Plug 'rust-lang/rust.vim'               " rust syntax
  Plug 'MaxMEllon/vim-jsx-pretty'         " jsx syntax
  Plug 'martinda/Jenkinsfile-vim-syntax'
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  Plug 'thoughtbot/vim-rspec'
  Plug 'leafOfTree/vim-svelte-plugin'
  Plug 'github/copilot.vim'
call plug#end()
let g:gutentags_ctags_exclude = ['.git', '.serverless', 'dist', 'package-lock.json', 'build']
let g:rg_command = 'rg --vimgrep -S'
let g:ackprg = 'ag --column'
let g:mkdp_auto_start = 1

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
nno <leader>b   orequire 'pry'; binding.pry<ESC>
nno <leader>B   Orequire 'pry'; binding.pry<ESC>
nno <leader>bd  :bp<cr>:bd #<cr>
nno <leader>cl  oconsole.log()<ESC>i
nno <leader>Cl  Oconsole.log()<ESC>i
nno <leader>cp  :!cp <C-R><C-F> <C-R><C-F>
nno <leader>d   odebugger<ESC>
nno <leader>D   Odebugger<ESC>
nno <leader>da  :bufdo bd<CR>-
nno <leader>F   :Rg | " leave a space
nno <leader>g   :Git | " leave a space
nno <leader>G   :Git! | " leave a space
nno <leader>gbl :Git blame<CR>
nno <leader>br  :Git branch<CR>
nno <leader>gbr :Git branch<CR>
nno <leader>gc  :Git commit<CR>
nno <leader>ch  :Git checkout | " leave a space
nno <leader>fi  mzgg=G'z
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
nno <leader>h   :tabprev<CR>
nno <leader>js  :%!python -m json.tool<CR>
nno <leader>l   :tabnext<CR>
nno <leader>pll :Git pull<CR>
nno <leader>psh :Git push<CR>
nno <leader>t   :tabnew<CR>
nno <leader>js  :%!python -m json.tool<CR>
nno <leader>v   gg V G
nno <leader>[  :tabprev<CR>
nno <leader>]  :tabnext<CR>
nno <leader>tc  :tabclose<CR>
nno ; :

nno <leader>s   :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>
nnoremap <leader>tf :JestCurrent<CR>
nnoremap <leader>tr :Jest<CR>
nno <C-H>       <C-W><C-H>
nno <NL>        <C-W><NL>
nno <C-K>       <C-W><C-K>
nno <C-L>       <C-W><C-L>

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
      \ "source": s:list_buffers(),
      \ "sink*": { lines -> s:delete_buffers(lines) },
      \ "options": "--multi --reverse --bind ctrl-a:select-all+accept"
      \ }))
