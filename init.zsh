# shellcheck shell=zsh

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
    p6m7g8/p6df-perl
    p6m7g8/p6df-go
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

  brew install shfmt
  brew install --cask kite

  brew install --cask visual-studio
  brew install --cask visual-studio-code
  brew install --cask visual-studio-code-insiders
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
# Function: p6df::modules::vscode::langs()
#
#>
######################################################################
p6df::modules::vscode::langs() {

  go get golang.org/x/tools/gopls

  cpanm --force --notest Perl::LanguageServer

  code --install-extension alefragnani.Bookmarks
  code --install-extension bierner.markdown-preview-github-styles
  code --install-extension christian-kohler.path-intellisense
  code --install-extension CoenraadS.bracket-pair-colorizer-2
  code --install-extension dbaeumer.vscode-eslint
  code --install-extension foxundermoon.shell-format
  code --install-extension golang.go
  code --install-extension GregorBiswanger.json2ts
  code --install-extension hashicorp.terraform
  code --install-extension ipedrazas.kubernetes-snippets
  code --install-extension jmMeessen.jenkins-declarative-support
  code --install-extension ms-python.python
  code --install-extension ms-python.vscode-pylance
  code --install-extension ms-vsliveshare.vsliveshare
  code --install-extension ms-vsliveshare.vsliveshare-pack
  code --install-extension naumovs.color-highlight
  code --install-extension redhat.vscode-yaml
  code --install-extension ritwickdey.LiveServer
  code --install-extension shardulm94.trailing-spaces
  code --install-extension shd101wyy.markdown-preview-enhanced
  code --install-extension streetsidesoftware.code-spell-checker
  code --install-extension timonwong.shellcheck
  code --install-extension vscode-icons-team.vscode-icons
  code --install-extension wayou.vscode-todo-highlight
  code --install-extension yzane.markdown-pdf
  code --install-extension yzhang.markdown-all-in-one
}

######################################################################
#<
#
# Function: p6df::modules::vscode::init()
#
#>
######################################################################
p6df::modules::vscode::init() {

  alias ca='code -a .'
  alias cn='code -n .'
}
