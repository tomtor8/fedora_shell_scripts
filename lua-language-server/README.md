# Description

- this script runs sumneko lua language server

# Instructions

1. download `lua-language-server....linux-x64.tar.gz` file from the releases page (see link below)
2. extract the file to ~/.config/
3. create this script `lua-language-server.sh` with the following code

```shell
#!/bin/bash
exec "/home/tom/.config/lua-language-server-3.6.4-linux-x64/bin/lua-language-server" "$@"
```

4. make the file executable and hard link the file to your `~/bin` directory that is located on $PATH

```shell
ln lua-language-server.sh ~/bin/lua-language-server
```

5. cd $HOME and check the language server by running `lua-language-server --version`
6. enable the language server in your nvim configuration

# Links

- [sumneko/lua-language-server](https://github.com/sumneko/lua-language-server) 
- [releases page](https://github.com/sumneko/lua-language-server/releases) 
