local ok, trouble = pcall(require, "trouble")
if not ok then
	print("trouble is not installed correctly")
	return
end

trouble.setup({ auto_close = true })
