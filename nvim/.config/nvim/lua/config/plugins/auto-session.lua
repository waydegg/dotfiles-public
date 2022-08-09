local ok, auto_session = pcall(require, "auto-session")
if not ok then
	print("'auto-session' not installed")
	return
end

auto_session.setup({})
