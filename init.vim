" to ~/.vimrc add: source $ROMAN_DOTFILES/vimrc
set nocompatible           " Set this first for all further settings

function! MyFoldText()
  let nl = v:foldend - v:foldstart + 1
  let txt = getline(v:foldstart) . ': ' . nl . ' lines'
  return txt
endfunction

" set background=dark        " Use colors good for a dark bg. Does NOT set bg clr.
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
set undofile                    " so if i close and reopen a file i can still undo
set undodir=$HOME/.vimundodir   " store undo history in a directory
" set shellcmdflag=-ic           " Make vim command line recognize bash aliases

exec "set listchars=tab:--,trail:\uB7,nbsp:~,eol:¬,extends:→,precedes:←"

filetype off               " Needed for plugin initialization
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
  " Plugin 'vim-vdebug/vdebug'
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
  Plugin 'L9'                               " General utility functions.
  Plugin 'MarcWeber/vim-addon-mw-utils'     " Dependency of vim-snipmate.
  Plugin 'mileszs/ack.vim'                  " The Silver Searcher / ag.
  Plugin 'mustache/vim-mustache-handlebars' " Mustache/hbs syntax & abbrevs.
  Plugin 'nathanaelkane/vim-indent-guides'  " Highlight indented column space.
  Plugin 'pangloss/vim-javascript'          " Javascript syntax, indenting.
  Plugin 'Raimondi/delimitMate'             " Insert mode auto-closing quotes, parens, brackets.
  Plugin 'tpope/vim-vinegar'
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
  " Plugin 'vim-airline/vim-airline'
  " Plugin 'vim-airline/vim-airline-themes'
  Plugin 'vim-utils/vim-man'
  Plugin 'vim-ruby/vim-ruby'                " Ruby configuration files.







  Plugin 'tpope/vim-sensible'               " a good place to start
  Plugin 'tomasiser/vim-code-dark'          " theme
  Plugin 'ryanoasis/vim-devicons'           " icons for things

  Plugin 'kevindurb/vim-splits'             " split settings and keymaps
  Plugin 'kevindurb/vim-whiteout'           " show trailing whitespace


  Plugin 'tpope/vim-repeat'                 " repeating plugin commands
  Plugin 'tpope/vim-surround'               " surround with things
  Plugin 'tpope/vim-unimpaired'             " mappings for things with '['
  Plugin 'tpope/vim-dispatch'               " add backgrounding

  Plugin 'cespare/vim-toml'                 " rust config files
  Plugin 'rust-lang/rust.vim'               " rust syntax
  Plugin 'MaxMEllon/vim-jsx-pretty'         " jsx syntax
  Plugin 'leafgarland/typescript-vim'       " typescript syntax

  " Plugin 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

  Plugin 'alvan/vim-closetag'               " autoclose tags
  Plugin 'w0rp/ale'                         " syntax and style checking
  Plugin 'vim-vdebug/vdebug'                " debug php
  Plugin 'ludovicchabant/vim-gutentags'     " auto tag file management

  Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plugin 'junegunn/fzf.vim'
call vundle#end()

" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_section_y=""
" let g:airline_powerline_fonts=0
" let g:airline_theme='jellybeans'
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_section_y = "%{strlen(&ft)?&ft:'none'}"
" let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#branch#displayed_head_limit = 15
" let g:ctrlp_show_hidden=1
let g:ackprg = 'ag --column'
let g:syntastic_check_on_open=1
let g:mustache_abbreviations = 1
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let &colorcolumn=81

filetype indent plugin on
syntax on                   " Colors


nno ; :
nno <leader>a   :Ack | " leave a space
nno <leader>b   orequire 'pry'; binding.pry<ESC>
nno <leader>B   Orequire 'pry'; binding.pry<ESC>
nno <leader>bf  :bfirst<CR>
nno <leader>bl  :blast<CR>
nno <leader>bd  :bp<cr>:bd #<cr>
nno <leader>bi  :!bundle install<CR>
nno <leader>bo  :Bvsplit | " leave a space
nno <leader>bu  :!bundle update<CR>
nno <leader>cd  :cd
nno <leader>ch  :Git checkout | " leave a space
nno <leader>cl  oconsole.log()<ESC>i
nno <leader>Cl  Oconsole.log()<ESC>i
nno <leader>d   odebugger<ESC>
nno <leader>dg  :diffget
nno <leader>dp  :diffput
nno <leader>D   Odebugger<ESC>
nno <leader>fi  mzgg=G'z
nno <leader>g   :Git | " leave a space
nno <leader>gd  :Gdiff
nno <leader>ge  :Gedit
nno <leader>gf  :Gfetch
nno <leader>gr  :Gread
nno <leader>gw  :Gwrite
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
nno <leader>P   o<Esc>pkJ
nno <leader>pll :Gpull<CR>
nno <leader>psh :Gpush<CR>
nno <leader>r   :w !sudo tee % <CR> " save the files using sudo
nno <leader>s   :source ~/.vimrc<CR>
nno <leader>TS  :%s/\s\+$//<CR>
nno <leader>t   :tabnew<CR>
nno <leader>tc  :tabclose<CR>
nno <leader>th  :tabprev<CR>
nno <leader>tl  :tabnext<CR>
nno <leader>v   gg V G
nno <leader>vs  :tabnew <CR>:e ~/dotfiles/vimrc<CR>
nno <leader>zh  20zh
nno <leader>zl  40zl
nno <leader>1   :!
nno <C-p> :FZF<CR>

colorscheme inkpot

hi Folded ctermfg=red
hi Folded ctermbg=black
augroup language_tabbing
  autocmd!
  autocmd Filetype php        setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd Filetype css        setlocal ts=2 sts=2 sw=2 expandtab
  autocmd Filetype html       setlocal ts=2 sts=2 sw=2 expandtab
augroup END




" ale settings
let g:ale_linters = {
\ 'graphql': ['gqlint'],
\ 'javascript': ['eslint'],
\ 'javascript jsx': ['eslint'],
\ 'css': ['stylelint'],
\ 'ruby': [],
\}
let g:ale_php_phpcs_standard = '/Users/rhood/Development/churchcommunitybuilder/app/src/phpcs_ruleset.xml'
let g:ale_php_phpcs_executable = '/Users/rhood/Development/churchcommunitybuilder/app/vendor/bin/phpcs'
let g:ale_php_phpcs_use_global = 0
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\  'rust': ['rustfmt'],
\  'go': ['gofmt'],
\}
let g:ale_fix_on_save = 1
" match pairs
let delimitMate_matchpairs = "(:),[:],{:}"

" autoclose jsx
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js"
