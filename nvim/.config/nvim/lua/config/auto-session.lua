local ok, auto_session = pcall(require, "auto-session")
if not ok then
	print("auto-session is not installed correctly")
	return
end

auto_session.setup({})
