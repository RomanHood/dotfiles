-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local save_group = vim.api.nvim_create_augroup("AutoSave", { clear = true })

-- List of events that trigger an auto-save
local save_events = {
  "InsertLeave", -- When leaving insert mode
  "TextChanged", -- After a text change (includes undo/redo)
  "TextChangedI", -- After a text change in insert mode
  "TextChangedP", -- After a text change caused by a paste
}

-- Create the autocmd for each event
for _, event in ipairs(save_events) do
  vim.api.nvim_create_autocmd(event, {
    group = save_group,
    pattern = "*",
    command = "silent! write",
    desc = "Auto save on " .. event,
  })
end
