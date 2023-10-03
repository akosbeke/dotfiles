# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/akosbeke/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    docker
    nvm
    react-native
    vscode
    yarn
    zsh-autosuggestions
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias code="code-insiders"
alias nv="nvim"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias gv='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gr="git fetch && git rebase origin/master"
alias ga="git add --all"
alias gs="git status"
alias gc="git commit -m"
alias gch="git checkout"
alias gnb="git checkout master && git pull && git checkout -b"
alias gp="git push"
alias docker-cleanup="docker image prune --force && docker system prune --volumes --force"
alias ta="tmux a"
alias td="tmux detach"
alias dds="find . -name '.DS_Store' -type f -delete"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/php@8.0/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.0/sbin:$PATH"
export PATH="$HOME/.symfony/bin:$PATH"
#export TERM=screen-256color-bce

# Lingoda Dev Aliases
export LINGODA_PATH="~/Lingoda"
alias lingoda="sh $LINGODA_PATH/lingoda/linguando/devops/localdev/localdev.sh"
alias lm="make -s -C $LINGODA_PATH/lingoda/linguando/devops/localdev/docker"
alias l-student="( (nginx -s reload || nginx) && cd $LINGODA_PATH/lingoda/linguando && yarn student_frontend:watch)"
alias l-student-sym="(cd $LINGODA_PATH/lingoda/linguando && yarn student:watch)"
alias l-teacher="(cd $LINGODA_PATH/lingoda/linguando && yarn teacher_frontend:watch)"
alias l-quiz="(cd $LINGODA_PATH/lingoda/quiz-engine && yarn run start:dev)"
alias l-quiz-env="(cd $LINGODA_PATH/lingoda/quiz-engine/devops/localdev && REDIS_PORT=6380 HTTP_PORT=81 HTTPS_PORT=444 POSTGRES_PORT=5433 docker compose up)"
alias l-storybook="(cd $LINGODA_PATH/lingoda/linguando && yarn storybook)"
alias l-e2e="(HTTPS_PROXY=http://127.0.0.1:7080 cd $LINGODA_PATH/lingoda/workspaces && yarn e2e)"
alias l-start="(cd $LINGODA_PATH/lingoda/linguando && lingoda start && symfony proxy:start && symfony server:start -d)"
alias l-stop="(cd $LINGODA_PATH/lingoda/linguando && symfony server:stop && symfony proxy:stop  && lingoda stop)"
alias l-update="sh $LINGODA_PATH/lingoda-db-update.sh"
alias l-codegen="(cd $LINGODA_PATH/lingoda/workspaces && yarn generate)"
alias l-routes="(cd $LINGODA_PATH/lingoda/linguando && app/bin/dump-frontend-routes)"
# Translations
alias lt-extract="(cd $LINGODA_PATH/lingoda/linguando && app/bin/extract-translations --all-domains)"
alias lt-generate="(cd $LINGODA_PATH/lingoda/linguando && php bin/console bazinga:js-translation:dump ../workspaces/packages --merge-domains --format=js)"
alias lt-upload="(cd $LINGODA_PATH/lingoda/linguando && php bin/console lg:translations:upload)"
alias lt-upload-dr="(cd $LINGODA_PATH/lingoda/linguando && php bin/console lg:translations:upload --dry-run)"
alias lt-download="(cd $LINGODA_PATH/lingoda/linguando && php bin/console lg:translations:download --parent-branch master)"
export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"

eval "$(github-copilot-cli alias -- "$0")"
