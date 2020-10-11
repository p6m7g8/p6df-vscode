# shellcheck shell=zsh
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
p6df::modules::vscode::deps() {
  ModuleDeps=(
    p6m7g8/p6df-python
  )
}

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
# Function: p6df::modules::vscode::external::brew()
#
#>
######################################################################
p6df::modules::vscode::external::brew() {

  brew cask install kite
}

######################################################################
#<
#
# Function: p6df::modules::vscode::langs()
#
#>
######################################################################
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