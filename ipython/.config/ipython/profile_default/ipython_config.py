c = get_config()

c.InteractiveShell.autoindent = False

c.InteractiveShellApp.extensions = ["autoreload"]
c.InteractiveShellApp.exec_lines = ["%autoreload 2"]

c.TerminalInteractiveShell.editing_mode = "vi"
