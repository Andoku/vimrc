#!/bin/bash

VIM_CONFIG_PATH=$HOME/.vim_runtime

# Backup Amix's my_configs.vim
if [ -f $VIM_CONFIG_PATH/my_configs.vim ]; then
  echo "Beginning my_configs.vim backup.."
  mv $VIM_CONFIG_PATH/my_configs.vim $VIM_CONFIG_PATH/my_configs.vim.bkp
  echo "my_configs.vim backed up successfully.\n"
fi

# Patch .vimrc
echo "Beginning .vimrc patch.."
cat .vimrc > $VIM_CONFIG_PATH/my_configs.vim
echo ".vimrc patch complete.\n"

# Install additional plugins
echo "Installing linediff plugin.."
git clone https://github.com/AndrewRadev/linediff.vim.git $HOME/.vim_runtime/my_plugins/linediff.vim
echo "Installing vim-cpp-modern plugin.."
git clone https://github.com/bfrg/vim-cpp-modern.git $HOME/.vim_runtime/my_plugins/vim-cpp-modern
echo "Additional plugins installed successfully.\n"

echo "Settings have been applied successfully."
