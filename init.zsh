######################################################################
#<
#
# Function: p6df::modules::vscode::version()
#
#>
######################################################################
p6df::modules::vscode::version() { echo "0.0.1" }
######################################################################
#<
#
# Function: p6df::modules::vscode::deps()
#
#>
######################################################################
p6df::modules::vscode::deps()    { ModuleDeps=() }

######################################################################
#<
#
# Function: p6df::modules::vscode::external::brew()
#
#>
######################################################################
p6df::modules::vscode::external::brew() {

  brew cask install visual-studio
  brew cask install visual-studio-code
  brew cask install visual-studio-code-insiders
}

######################################################################
#<
#
# Function: p6df::modules::vscode::home::symlink()
#
#>
######################################################################
p6df::modules::vscode::home::symlink() {

  ## fill in template
  ln -fs $P6_DFZ_SRC_P6M7G8_DIR/p6df-vscode/share/settings.json $HOME/Library/Applications\ Support/Code/User/settings.json
}

######################################################################
#<
#
# Function: p6df::modules::vscode::init()
#
#>
######################################################################
p6df::modules::vscode::init() {

  true
}
