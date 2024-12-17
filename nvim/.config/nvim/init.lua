local themeStatus, kanagawa = pcall(require, "kanagawa")

if themeStatus then
	vim.cmd("colorscheme kanagawa")
else
	return
end

local save_group = vim.api.nvim_create_augroup("AutoSave", { clear = true })

-- List of events that trigger an auto-save
local save_events = {
  "InsertLeave",     -- When leaving insert mode
  "TextChanged",     -- After a text change (includes undo/redo)
  "TextChangedI",    -- After a text change in insert mode
  "TextChangedP",    -- After a text change caused by a paste
}

-- Create the autocmd for each event
for _, event in ipairs(save_events) do
  vim.api.nvim_create_autocmd(event, {
    group = save_group,
    pattern = "*",
    command = "silent! write",
    desc = "Auto save on " .. event
  })
end

require("config.lazy")
