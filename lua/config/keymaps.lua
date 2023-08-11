-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Move Lines
map("n", "<Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- save file
-- map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
