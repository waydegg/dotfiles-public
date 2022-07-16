local dap = require("dap")

-- Lua
dap.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance",
		host = function()
			local value = vim.fn.input("Host [127.0.0.1]: ")
			if value ~= "" then
				return value
			end
			return "127.0.0.1"
		end,
		port = function()
			local val = tonumber(vim.fn.input("Port: "))
			assert(val, "Please provide a port number")
			return val
		end,
	},
}

dap.adapters.nlua = function(callback, config)
	callback({ type = "server", host = config.host, port = config.port })
end

-- Typescript/javascript
dap.configurations.typescript = {
	{
		type = "node2",
		request = "attach",
		host = function()
			local value = vim.fn.input("Host [127.0.0.1]: ")
			if value ~= "" then
				return value
			end
			return "127.0.0.1"
		end,
		port = function()
			local value = tonumber(vim.fn.input("Port [9229]: "))
			if value ~= "" then
				return value
			end
			return "9229"
		end,
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		skipFiles = { "<node_internals>/**/*.js" },
	},
}

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = {
		"/Users/waydegg/ghq/github.com/microsoft/vscode-node-debug2/out/src/nodeDebug.js",
	},
}
