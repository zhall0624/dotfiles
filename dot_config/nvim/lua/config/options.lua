-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.termguicolors = true

-- vim.opt.signcolumn = "yes"
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "ruby",
--   callback = function()
--     vim.lsp.start({
--       name = "rubocop",
--       cmd = { "bundle", "exec", "rubocop", "--lsp" },
--     })
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.rb",
--   callback = function()
--     vim.lsp.buf.format()
--   end,
-- })
