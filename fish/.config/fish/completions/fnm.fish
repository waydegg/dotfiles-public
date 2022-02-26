complete -c fnm -n "__fish_use_subcommand" -l node-dist-mirror -d 'https://nodejs.org/dist/ mirror' -r
complete -c fnm -n "__fish_use_subcommand" -l fnm-dir -d 'The root directory of fnm installations' -r
complete -c fnm -n "__fish_use_subcommand" -l multishell-path -d 'Where the current node version link is stored. This value will be populated automatically by evaluating `fnm env` in your shell profile. Read more about it using `fnm help env`' -r
complete -c fnm -n "__fish_use_subcommand" -l log-level -d 'The log level of fnm commands' -r -f -a "{quiet     ,info   ,all    ,error  }"
complete -c fnm -n "__fish_use_subcommand" -l arch -d 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary' -r
complete -c fnm -n "__fish_use_subcommand" -l version-file-strategy -d 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation' -r -f -a "{local     ,recursive      }"
complete -c fnm -n "__fish_use_subcommand" -l help -d 'Print help information'
complete -c fnm -n "__fish_use_subcommand" -l version -d 'Print version information'
complete -c fnm -n "__fish_use_subcommand" -f -a "list-remote" -d 'List all remote Node.js versions'
complete -c fnm -n "__fish_use_subcommand" -f -a "list" -d 'List all locally installed Node.js versions'
complete -c fnm -n "__fish_use_subcommand" -f -a "install" -d 'Install a new Node.js version'
complete -c fnm -n "__fish_use_subcommand" -f -a "use" -d 'Change Node.js version'
complete -c fnm -n "__fish_use_subcommand" -f -a "env" -d 'Print and set up required environment variables for fnm'
complete -c fnm -n "__fish_use_subcommand" -f -a "completions" -d 'Print shell completions to stdout'
complete -c fnm -n "__fish_use_subcommand" -f -a "alias" -d 'Alias a version to a common name'
complete -c fnm -n "__fish_use_subcommand" -f -a "unalias" -d 'Remove an alias definition'
complete -c fnm -n "__fish_use_subcommand" -f -a "default" -d 'Set a version as the default version'
complete -c fnm -n "__fish_use_subcommand" -f -a "current" -d 'Print the current Node.js version'
complete -c fnm -n "__fish_use_subcommand" -f -a "exec" -d 'Run a command within fnm context'
complete -c fnm -n "__fish_use_subcommand" -f -a "uninstall" -d 'Uninstall a Node.js version'
complete -c fnm -n "__fish_seen_subcommand_from list-remote" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from list-remote" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from list" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from list" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from install" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from install" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from install" -l lts -d 'Install latest LTS'
complete -c fnm -n "__fish_seen_subcommand_from use" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from use" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from use" -l install-if-missing -d 'Install the version if it isn\'t installed yet'
complete -c fnm -n "__fish_seen_subcommand_from use" -l silent-if-unchanged -d 'Don\'t output a message identifying the version being used if it will not change due to execution of this command'
complete -c fnm -n "__fish_seen_subcommand_from env" -l shell -d 'The shell syntax to use. Infers when missing' -r -f -a "{bash ,zsh    ,fish   ,powershell  }"
complete -c fnm -n "__fish_seen_subcommand_from env" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from env" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from env" -l multi -d 'Deprecated. This is the default now'
complete -c fnm -n "__fish_seen_subcommand_from env" -l use-on-cd -d 'Print the script to change Node versions every directory change'
complete -c fnm -n "__fish_seen_subcommand_from completions" -l shell -d 'The shell syntax to use. Infers when missing' -r
complete -c fnm -n "__fish_seen_subcommand_from completions" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from completions" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from alias" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from alias" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from unalias" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from unalias" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from default" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from default" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from current" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from current" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from exec" -l using -d 'Either an explicit version, or a filename with the version written in it' -r
complete -c fnm -n "__fish_seen_subcommand_from exec" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from exec" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from exec" -l using-file -d 'Deprecated. This is the default now'
complete -c fnm -n "__fish_seen_subcommand_from uninstall" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from uninstall" -l version -d 'Print version information'

