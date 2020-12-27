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
    p6m7g8/p6df-node
    p6m7g8/p6df-python
    p6m7g8/p6df-perl
    p6m7g8/p6df-go
    p6m7g8/p6df-ruby
    p6m7g8/p6df-java
    p6m7g8/p6df-shell
    sobolevn/wakatime-zsh-plugin
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

  pip install wakatime

  go get golang.org/x/tools/gopls

  cpanm --force --notest Perl::LanguageServer

  code --install-extension alefragnani.Bookmarks
  code --install-extension amazonwebservices.aws-toolkit-vscode
  code --install-extension aws-amplify.aws-amplify-vscode
  code --install-extension bierner.markdown-preview-github-styles
  code --install-extension christian-kohler.path-intellisense
  code --install-extension CoenraadS.bracket-pair-colorizer-2
  code --install-extension dbaeumer.vscode-eslint
  code --install-extension eamodio.gitlens
  code --install-extension esbenp.prettier-vscode
  code --install-extension FedericoVarela.pipenv-scripts
  code --install-extension foxundermoon.shell-format
  code --install-extension GitHub.vscode-codeql
  code --install-extension GitHub.vscode-pull-request-github
  code --install-extension GregorBiswanger.json2ts
  code --install-extension hashicorp.terraform
  code --install-extension hbenl.vscode-test-explorer
  code --install-extension iann0036.live-share-for-aws-cloud9
  code --install-extension ipedrazas.kubernetes-snippets
  code --install-extension jetmartin.bats
  code --install-extension jmMeessen.jenkins-declarative-support
  code --install-extension lfs.vscode-emacs-friendly
  code --install-extension loganarnett.lambda-snippets
  code --install-extension ms-azuretools.vscode-docker
  code --install-extension ms-python.python
  code --install-extension ms-python.vscode-pylance
  code --install-extension ms-toolsai.jupyter
  code --install-extension ms-vscode-remote.remote-containers
  code --install-extension ms-vsliveshare.vsliveshare
  code --install-extension ms-vsliveshare.vsliveshare-pack
  code --install-extension naumovs.color-highlight
  code --install-extension paiqo.databricks-vscode
  code --install-extension redhat.vscode-yaml
  code --install-extension richterger.perl
  code --install-extension ritwickdey.LiveServer
  code --install-extension sfodje.perltidy
  code --install-extension shardulm94.trailing-spaces
  code --install-extension shd101wyy.markdown-preview-enhanced
  code --install-extension streetsidesoftware.code-spell-checker
  code --install-extension thundra.thundra-debugger
  code --install-extension timonwong.shellcheck
  code --install-extension VisualStudioExptTeam.vscodeintellicode
  code --install-extension vscode-aws-console.vscode-aws-console
  code --install-extension vscode-icons-team.vscode-icons
  code --install-extension WakaTime.vscode-wakatime
  code --install-extension wayou.vscode-todo-highlight
  code --install-extension Wscats.cors-browser
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

  p6df::modules::vscode::wakatime::init
  p6df::modules::vscode::aliases::init
}

p6df::modules::vscode::wakatime::init() {

  . $P6_DFZ_SRC_DIR/sobolevn/wakatime-zsh-plugin/wakatime.plugin.zsh
}

######################################################################
#<
#
# Function: p6df::modules::vscode::aliases::init()
#
#>
######################################################################
p6df::modules::vscode::aliases::init() {

  alias p6_ca="p6_vscode_tmux_add"
  alias p6_cn="p6_vscode_new"
}

######################################################################
#<
#
# Function: code rc = p6_vscode_cmd(cmd, ...)
#
#  Args:
#	cmd -
#	... -
#
#  Returns:
#	code - rc
#
#>
######################################################################
p6_vscode_cmd() {
  local cmd="$1"
  shift 1

  local log_type
  case $cmd in
  *) log_type=p6_run_write_cmd ;;
  esac

  p6_run_code "$log_type code $cmd $*"
  local rc=$?

  p6_return_code_as_code "$rc"
}

######################################################################
#<
#
# Function: p6_vscode_new([dir=.])
#
#  Args:
#	OPTIONAL dir - [.]
#
#>
######################################################################
p6_vscode_new() {
  local dir="${1:-.}"

  p6_vscode_cmd -n "$dir"
}

######################################################################
#<
#
# Function: p6_vscode_add([dir=.])
#
#  Args:
#	OPTIONAL dir - [.]
#
#>
######################################################################
p6_vscode_add() {
  local dir="${1:-.}"

  p6_vscode_cmd -a "$dir"
}

######################################################################
#<
#
# Function: p6_vscode_tmux_add()
#
#>
######################################################################
p6_vscode_tmux_add() {

  local session="vscode-$(pwd | md5)"
  p6_vscode_add "."
  p6df::modules::shell::tmux::make "$session"
}
