local dap = require('dap')

vim.fn.sign_define('DapBreakpoint', {text='⬤', texthl='RedSign', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='➔', texthl='PurpleSign', linehl='', numhl=''})

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {'/Users/waydegg/ghq/github.com/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
  {
    type = 'node2',
    request = 'attach',
    name = 'biggly',
    port = 9229
  }
}

local function attach()
  print("attaching")
  dap.run({
      type = 'node2',
      request = 'attach',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = {'<node_internals>/**/*.js'},
      })
end
