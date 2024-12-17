local global = vim.g
local o = vim.o
local wo = vim.wo

vim.scriptencoding = "utf-8"

-- Map <leader>

global.mapleader = "\\"
global.maplocalleader = "\\"

-- Editor options

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

o.number = true -- Print the line number in front of each line
-- o.relativenumber = true -- Show the line number relative to the line with the cursor in front of each line.
o.clipboard = "unnamedplus" -- uses the clipboard register for all operations except yank.
o.syntax = "on" -- When this option is set, the syntax with this name is loaded.
o.autoindent = true -- Copy indent from current line when starting a new line.
o.cursorline = true -- Highlight the screen line of the cursor with CursorLine.
o.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
o.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent.
o.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for.
o.encoding = "utf-8" -- Sets the character encoding used inside Vim.
o.fileencoding = "utf-8" -- Sets the character encoding for the file of this buffer.
o.ruler = true -- Show the line and column number of the cursor position, separated by a comma.
o.mouse = "a" -- Enable the use of the mouse. "a" you can use on all modes
o.title = true -- When on, the title of the window will be set to the value of 'titlestring'
o.hidden = true -- When on a buffer becomes hidden when it is |abandon|ed
o.ttimeoutlen = 0 -- The time in milliseconds that is waited for a key code or mapped key sequence to complete.
o.wildmenu = true -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
o.showcmd = true -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
o.showmatch = true -- When a bracket is inserted, briefly jump to the matching one.
o.inccommand = "split" -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.
-- o.splitbelow = "splitright" -- When on, splitting a window will put the new window below the current one
o.splitbelow = false -- When on, splitting a window will put the new window below the current one
wo.wrap = false -- Don't wrap long lines, scroll off screen instead.

vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<NL>", "<C-W><NL>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-p>", ":Telescope git_files<CR>")
vim.keymap.set("n", "<C-f>", ":Telescope find_files<CR>")
vim.keymap.set("n", "<C-b>", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>1", ":!")
vim.keymap.set("n", "<leader>b", "orequire 'pry'; binding.pry<ESC>")
vim.keymap.set("n", "<leader>B", "Orequire 'pry'; binding.pry<ESC>")
vim.keymap.set("n", "<leader>bd", ":bp<cr>:bd #<cr>")
vim.keymap.set("n", "<leader>cl", "oconsole.log()<ESC>i")
vim.keymap.set("n", "<leader>Cl", "Oconsole.log()<ESC>i")
vim.keymap.set("n", "<leader>cp", ":!cp <C-R><C-F> <C-R><C-F>")
vim.keymap.set("n", "<leader>d", "odebugger<ESC>")
vim.keymap.set("n", "<leader>d", "odebugger<ESC>")
vim.keymap.set("n", "<leader>D", "Odebugger<ESC>")
vim.keymap.set("n", "<leader>da", ":bufdo bd<CR>-")
-- vim.keymap.set('n', '<leader>F',   ':Rg | ')
vim.keymap.set("n", "gr", ":Telescope grep_string<CR>")
vim.keymap.set("n", "<leader>F", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>g", ":Git ")
vim.keymap.set("n", "<leader>G", ":Git ")
vim.keymap.set("n", "<leader>gbl", ":Git blame<CR>")
vim.keymap.set("n", "<leader>br", ":Git branch<CR>")
-- vim.keymap.set('n', '<leader>gbr', ':Git branch<CR>')
vim.keymap.set("n", "<leader>gbr", ":Telescope git_branches<CR>")
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
vim.keymap.set("n", "<leader>ch", ":Git checkout | ")
vim.keymap.set("n", "<leader>fi", "mzgg=G'z")
vim.keymap.set("n", "<leader>gd", ":Gdiff<CR>")
vim.keymap.set("n", "<leader>ge", ":Gedit")
vim.keymap.set("n", "<leader>gf", ":Gfetch")
vim.keymap.set("n", "<leader>gl", ":Git log<CR>")
vim.keymap.set("n", "<leader>gm", ":Gmerge | ")
vim.keymap.set("n", "<leader>gdg", ":diffget")
vim.keymap.set("n", "<leader>gdp", ":diffput")
vim.keymap.set("n", "<leader>gp", ":Git push | ")
vim.keymap.set("n", "<leader>gr", ":Gread")
vim.keymap.set("n", "<leader>gs", ":Git<CR>")
vim.keymap.set("n", "<leader>gt", ":Git tree<CR>")
vim.keymap.set("n", "<leader>gw", ":Gwrite")
vim.keymap.set("n", "<leader>h", ":tabprev<CR>")
vim.keymap.set("n", "<leader>js", ":%!python -m json.tool<CR>")
vim.keymap.set("n", "<leader>l", ":tabnext<CR>")
vim.keymap.set("n", "<leader>pll", ":Git pull<CR>")
vim.keymap.set("n", "<leader>psh", ":Git push<CR>")
vim.keymap.set("n", "<leader>t", ":tabnew<CR>")
vim.keymap.set("n", "<leader>js", ":%!python -m json.tool<CR>")
vim.keymap.set("n", "<leader>v", "gg V G")
vim.keymap.set("n", "<leader>[", ":NeoTreeClose<CR>")
vim.keymap.set("n", "<leader>]", ":tabnext<CR>")
vim.keymap.set("n", "<leader>]", ":NeoTreeReveal<CR>")
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")
vim.keymap.set("n", ";", ":")
