-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--
local function start_ruby_debugger()
  vim.fn.setenv("RUBYOPT", "-rdebug/open")
  require("dap").continue()
end

local function start_rspec_debugger()
  local command = "rspec"
  if vim.fn.filereadable("bin/rspec") then
    command = "bin/rspec"
  end
  print("Using command: " .. command)
  -- https://github.com/ruby/debug?tab=readme-ov-file#invoke-as-a-remote-debuggee
  vim.fn.setenv("RUBYOPT", "-rdebug/open_nonstop")
  require("dap").run({
    type = "ruby",
    name = "debug current rspec file",
    request = "attach",
    command = command,
    script = "${file}",
    port = 38698, -- TODO: might be nice to make sure this port is open
    server = "127.0.0.1",
    localfs = true, -- required to be able to set breakpoints locally
    waiting = 100, -- HACK: This is a race condition with the set RUBYOPT, if you get ECONNREFUSED try changing RUBYOPT to -rdebug/open
  })
end

return {
 {
   "<leader>dc",
   function()
     local filetype = vim.bo.filetype
     if filetype == "ruby" then
       start_ruby_debugger()
     else
       require("dap").continue()
     end
   end,
   desc = "Start/Continue",
 },
 {
   "<leader>dc",
   function()
     local filetype = vim.bo.filetype
     if filetype == "ruby" then
       start_ruby_debugger()
     else
       require("dap").continue()
     end
   end,
   desc = "Start/Continue",
 }
}
