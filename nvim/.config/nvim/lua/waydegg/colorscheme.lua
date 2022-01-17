vim.g.neosolarized_contrast = "high"
vim.g.neosolarized_termtrans = 1

local status_ok, _ = pcall(vim.cmd, "colorscheme NeoSolarized") 
if not status_ok then
  print("Unable to load NeoSolarized")
  return
end
