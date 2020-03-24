p6df::modules::vscode::version() { echo "0.0.1" }
p6df::modules::vscode::deps()    { ModuleDeps=() }

p6df::modules::vscode::external::brew() {

  brew cask install visual-studio
  brew cask install visual-studio-code
  brew cask install visual-studio-code-insiders
}

p6df::modules::vscode::home::symlink() {

  true
}

p6df::modules::vscode::init() {

  true
}

