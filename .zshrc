# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# see https://github.com/ohmyzsh/ohmyzsh

# Path to your oh-my-zsh installation.
export ZSH="/Users/adrianmuntean/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  forklift
  osx
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
declare -A abbrev
abbrev=(["bp-dev"]="site-development" ["another-abbv"]="site-development"
["a-third-abbv-dev"]="site-development" ["b-dev"]="something-else")

# git
alias gt='git status'
alias gitlog='git log --all --graph --decorate --oneline --simplify-by-decoration'
alias gitshowunpusheddiff='git diff origin/master..HEAD'
alias gitshowunpushedcommits='git log origin/master..HEAD'
alias gitresethard='git reset --hard HEAD~1'
alias gitresetsoft='git reset --soft HEAD~1'
alias gitcm='git checkout master'
alias gitpom='git checkout master && git pull origin master'
alias gitcommitamend='git commit --amend'
alias gitpush='git push origin $(git branch --show-current)'
alias gitpushforce='git push -f origin $(git branch --show-current)'
alias gitstashlist='git stash list'

# gh - need to install gh cli for these to work
alias gitshowprstatus='gh pr status'
alias gitopenrepo='gh repo view --web'
alias gitshowmyprs='gh pr status | awk -v RS= "/Created by you\n/" | grep -E "#[0-9]{3,7}"'

gitopenpr() {
       current_branch=$(git branch --show-current)
       gh pr view $current_branch --web
}

gitrebase() {
       current_branch=$(git branch --show-current)
       git checkout master && git pull origin master
       git checkout $current_branch
       git rebase master
}

gitprcheckout() {
      gh pr checkout $1
}

gitsquash() {
    echo "squashing the last $1 commits..."
    # Reset the current branch to the commit just before the last 12:
    git reset --hard HEAD~$1
    # HEAD@{1} is where the branch was just before the previous command.
    # This command sets the state of the index to be as it would just
    # after a merge from that commit:
    git merge --squash HEAD@{1}
    # Commit those squashed changes.  The commit message will be helpfully
    # prepopulated with the commit messages of all the squashed commits:
    git commit
}


alias cds='cd ~/source'
alias addalias='vi ~/.zshrc'
alias cdm='cd ~/source/maple'
alias cdf='cd ~/source/maple/frontend'
alias cdb='cd ~/source/maple/backend'
alias showalias='grep '"'"'^alias\|()'"'"' ~/.zshrc'
alias reloadzsrc='source ~/.zshrc'
alias cditermscripts='cd /Users/adrianmuntean/Library/Application\ Support/iTerm2/Scripts'
lessjson() {
    python -m json.tool "$1" | less
 }
 
# work related
alias runserver='python manage.py runserver'
alias buildfrontend='yarn build:dev'
alias runfrontend='yarn start:dev'
alias showmigrationsclassifieds='python manage.py showmigrations | sed -n '/classifieds/,/contenttypes/p''
alias showmigrations='python manage.py showmigrations'
alias shell='python manage.py shell'
alias activateenv='source env/bin/activate'
