p6df::modules::vscode::version() { echo "0.0.1" }
p6df::modules::vscode::deps()    { ModuleDeps=() }

p6df::modules::vscode::external::brew() {

  brew cask install visual-studio
  brew cask install visual-studio-code
  brew cask install visual-studio-code-insiders
}

p6df::modules::vscode::home::symlink() {

  ## fill in template
  ln -fs $P6_DFZ_SRC_P6M7G8_DIR/p6df-vscode/share/settings.json $HOME/Library/Applications\ Support/Code/User/settings.json
}

p6df::modules::vscode::init() {

  true
}

