# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export DOTFILES=$HOME/Development/dotfiles

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git xcode zsh-autosuggestions)

# User configuration

# Load all the files in /shell_load
typeset -U load_files
load_files=($DOTFILES/shell_load/**/*)
for file in $load_files
do
  source $file
done

#match_prev_cmd: Chooses the most recent match whose preceding history item matches the most recently executed command
#https://github.com/zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY="match_prev_cmd"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

SCRIPTS_PATH="/Users/francesco/Development/scripts"

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$SCRIPTS_PATH:$SCRIPTS_PATH/ctagsScripts:$GOBIN:/usr/local/go/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# Add Rust tools to PATH
export PATH=$PATH:$HOME/.cargo/bin

source $ZSH/oh-my-zsh.sh

# PROMPTS

#Add the pip dir to $PATH (this was needed since the Powerline command wasn't found, see https://github.com/powerline/powerline/issues/685 for more info
if [ -d "$HOME/Library/Python/2.7/bin" ]; then
    PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi

#Start powerline daemon (this should make prompt more fast according to
#https://github.com/powerline/powerline/issues/1653)
#powerline-daemon -q

# Powerline bash prompt
#. /Library/Python/2.7/site-packages/powerline/bindings/zsh/powerline.zsh
#old macs
#. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
#. /usr/local/bin/powerline/bindings/zsh/powerline.zsh

# Newline after prompt
#NEWLINE=$'\n'
#PS1=$PS1$NEWLINE

# Pure prompt (https://github.com/sindresorhus/pure)
# Initialize the prompt system (if not so already) and choose pure:

#Needed on AppleSilicon machines, where homebrew has changed path https://github.com/sindresorhus/pure/issues/5
fpath+=/opt/homebrew/share/zsh/site-functions

autoload -U promptinit; promptinit
prompt pure

# Change the default prompt symbol color to green
PROMPT='%(?.%F{076}❯.%F{red}❯)%f '

# Show system time in prompt
# 247 is gray in xterm colors https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
PROMPT='%F{247}%* '$PROMPT

# For customizations check https://github.com/sindresorhus/pure/wiki
# Show exit code of all (piped) commands in RPROMPT
precmd_pipestatus() {
	RPROMPT="%F{247}${(j.|.)pipestatus}" 
}
add-zsh-hook precmd precmd_pipestatus

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

#general aliases
alias hist='history'
alias hideDesktopIcons='defaults write com.apple.finder CreateDesktop false; killall Finder'
alias showDesktopIcons='defaults write com.apple.finder CreateDesktop true; killall Finder'
alias cdw='cd ~/Workspace' 
alias cdd='cd $HOME/Desktop'
alias cddw='cd $HOME/Downloads'
alias findn='find . -name'
alias b='bat'
alias c='code'

# bazel
alias bz='bazelisk'
alias bzb='bazelisk build'
alias bzq='bazelisk query'

#delete & move to trash aliases
alias rm="echo Use 'trash', or the full path i.e. '/bin/rm'"

#swift aliases
#This fixes a problem with swift repl and homebrew python
#https://forums.swift.org/t/swift-repl-starts-with-error-when-homebrew-python-is-installed/12927/2
alias swift='PATH="/usr/bin:$PATH" swift'
alias sp='swift package'

#xcode aliases 
XCODE_PLUGINS='/Users/francesco/Library/Application Support/Developer/Shared/Xcode/Plug-ins'
alias cdxcplugins='cd $XCODE_PLUGINS'

#Fastlane aliases
#Handy alias to avoid typing "bundle exec" each time. See https://docs.fastlane.tools/getting-started/ios/setup/#use-a-gemfile 
alias fastlane='bundle exec fastlane'

#shortcuts for jumping to the main app directory
APP=$HOME/Workspace/Spotify/client-ios
alias cdapp='cd $APP'

# jump to monorepo directory
MONO=$HOME/Workspace/Spotify/client
alias cdmono='cd $MONO'

LEARNING=$HOME/Dropbox/Learning
alias cdl='cd $LEARNING'

alias vi='vim'
alias v='vim'
alias vdiff='vim -d' # Open vim in diff mode

#open a file in vim with readonly mode
alias vimr='vim -R'

#Colors and exclude dir on GNU Grep
ggrep='ggrep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

#Prettify json
alias prettyjson='python -m json.tool'

#git aliases
alias gitPublishBranch='git push --set-upstream origin $(git_current_branch)'
# Clean merged branches, also support squashed branches. 
# More info: https://stackoverflow.com/questions/43489303/how-can-i-delete-all-git-branches-which-have-been-squash-and-merge-via-github
alias gitCleanMergedBranches='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse "$branch^{tree}") -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'
alias gaddconflicts='git diff --name-only --diff-filter=U --relative | xargs git add'

# Override oh my zsh glo alias with my own
alias glo='git log --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'' --date=short'


#git standup
alias gitStandup='git standup -m5 -s' # Raise depth to 5 and silence no activity messages

#find aliases
#Find a text inside xib files (using find and grep)
alias findInXib='find . -name "*.xib" -print0 | xargs -0 grep'

#define the env variable where Pods source file are placed (this is needed for "build.rb" to precompile pods)
export PODS='/Users/francesco/Workspace'

# cd into whatever is the forefront Finder window.
function cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

#NOTE: this should always be at THE END OF THE FILE (see https://github.com/zsh-users/zsh-syntax-highlighting)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(/opt/homebrew/bin/brew shellenv)"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fbigagnoli/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/fbigagnoli/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fbigagnoli/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/fbigagnoli/Downloads/google-cloud-sdk/completion.zsh.inc'; fi



# fzf
# Enable fzf keybindings
# https://github.com/junegunn/fzf#key-bindings-for-command-line
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setting fd as the default source for fzf (to respect gitignore)
# https://github.com/junegunn/fzf#respecting-gitignore
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

