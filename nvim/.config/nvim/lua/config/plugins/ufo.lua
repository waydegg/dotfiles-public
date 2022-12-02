local ufo_ok, ufo = pcall(require, "ufo")
if not ufo_ok then
	print("'ufo' not installed")
	return
end

ufo.setup()
