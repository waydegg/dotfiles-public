local ok, trouble = pcall(require, "trouble")
if not ok then
	print("'trouble' not installed")
	return
end

trouble.setup({ auto_close = true })
