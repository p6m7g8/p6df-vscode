# shellcheck shell=zsh
p6df::modules::vscode::version() { echo "0.0.1" }

p6df::modules::vscode::deps() {
  ModuleDeps=(
    p6m7g8/p6df-python
  )
}

p6df::modules::vscode::external::brew() {

  brew cask install visual-studio
  brew cask install visual-studio-code
  brew cask install visual-studio-code-insiders
}

p6df::modules::vscode::home::symlink() {

  ## fill in template
  ln -fs $P6_DFZ_SRC_P6M7G8_DIR/p6df-vscode/share/settings.json $HOME/Library/Applications\ Support/Code/User/settings.json
}

p6df::modules::vscode::external::brew() {

  brew cask install kite
}

p6df::modules::vscode::langs() {

  pip install -q nose
  pip install -q pylint
  pip install -q prospector
  pip install -q mypy
  pip install -q pylama
  pip install -q pydocstyle
  pip install -q flake9
  pip install -q bandit
  pip install -q pycodestyle

  pip install -q pep8
  pip install --upgrade autopep8
  pip install black
  pip install yapf
  pip install jedi
}

p6df::modules::vscode::init() {
  true
}
