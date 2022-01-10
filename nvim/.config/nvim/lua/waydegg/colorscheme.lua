local status_ok, _ = pcall(vim.cmd, "colorscheme NeoSolarized") 
if not status_ok then
  print("Unable to load NeoSolarized")
  return
end
vim.g.neosolarized_contrast = "high"
