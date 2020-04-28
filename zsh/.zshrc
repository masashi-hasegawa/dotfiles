export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/opt/go/libexec/bin:$PATH
export PATH="$HOME/.pyenv/shims/python3:$PATH"
export PATH=/Users/m_hasegawa/Library/Android/sdk:$PATH
export PATH="/Users/m_hasegawa/Library/Android/sdk/tools:$PATH"
export PATH="/Users/m_hasegawa/Library/Android/sdk/platform-tools:$PATH"
export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="/Users/m_hasegawa/development/flutter/bin:$PATH"

# GITHUBの環境変数
export GITHUB_TOKEN="1fb92bafaa96a870a1d267135389e79e94665bb6"

# ######################
# Variables
# ##########################################
# zsh
# -------------------------------------
HISTFILE=~/.zsh-history               # 履歴をファイルに保存する
HISTSIZE=100000                       # メモリ内の履歴の数
SAVEHIST=100000                       # 保存される履歴の数
setopt extended_history               # 履歴ファイルに時刻を記録
setopt share_history                  # 同一ホストで自分が動かしているすべてのzshのプロセスで履歴を共有
function history-all { history -E 1 } # 全履歴の一覧を出力する

# rbenv
# -------------------------------------

# For initializing
eval "$(rbenv init -)"

# npm
# -------------------------------------

# For global
export PATH="/usr/local/share/npm/bin:$PATH"

# For local
export PATH=$PATH:./node_modules/.bin

# For Android Development Environment
# -------------------------------------
export ANDROID_HOME=/Applications/android-sdk-macosx
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# For pyenv
# -------------------------------------
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# For Gatech Simulator
export GOOGLE_CLIENT_ID=452208732186-n2idb9ns29r5mqk09kkmp37vmvft835s.apps.googleusercontent.com
export GOOGLE_CLIENT_SECRET=myKAtvUTOk6HoWfu0Nl567dZ

# ######################
# Aliases
# ##########################################

# For set .zshrc
# -------------------------------------
alias sz='source ~/.zshrc'
alias vz='vim ~/.zshrc'
alias az='atom ~/ .zshrc'
alias cz='code ~/ .zshrc'

# For set .vimrc
# -------------------------------------
alias sv='source ~/.vimrc'
alias vv='vim ~/.vimrc'
alias av='atom ~/ .vimrc'
alias cv='code ~/ .vimrc'

# For Global
# -------------------------------------
alias -g L='| less'
alias -g G='| grep'
alias sudo='sudo ' # sudoでaliasを有効に

# For set default vim to MacVim
# -------------------------------------
alias ll='(){ls -l $1 | awk '\''{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf("%0o ",k);print}'\''}'
alias lal='(){ls -al $1 | awk '\''{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf("%0o ",k);print}'\''}'


# For Git
# -------------------------------------
alias gini='git init'

alias gcm="git checkout master"
alias gcd="git checkout develop"
alias gco='git checkout'
alias gcoB='git checkout -B'
alias gs='git status'
alias ga='git add'
alias gai='git add -i'
alias gaN='git add -N'
alias gap='git add -p'
alias gc='git commit -m'
alias gca='git commit --amend -m'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias gg="git log --oneline --all --graph --date=short"
alias gsh='git stash'
alias ashp='git stash pop'
alias grl='git reflog'
alias grb='git rebase'
alias grbi='git rebase -i'

# For Bundler
# -------------------------------------
alias bini='bundle init'
alias bi='bundle install'
alias bip='bundle install --path vendor/bundle'
alias be='bundle exec'

# For Ruby
# -------------------------------------
alias r='ruby'

# For Ruby
# -------------------------------------
alias re='rbenv'

# For Rails
# -------------------------------------
alias brs='bundle exec rails s'
alias brc='bundle exec rails c'
alias brdb='bundle exec rails db'
alias brr='bundle exec rake routes'
alias brg='bundle exec rails g'

# For Swift
# -------------------------------------
alias bp='bundle exec pod'
alias bpi='bundle exec pod install'
alias bpu='bundle exec pod update'
alias bf='bundle exec fastlane'
alias cbpi='carthage bootstrap --platform iOS'

# For shortening cd command
# -------------------------------------
alias cdp='cd ~/projects'
alias cdb='cd ~/projects/bootcamp'
alias cdd='cd ~/.dotfiles'

# For Atom
# -------------------------------------
alias a='atom'

# For Brew Cask
# -------------------------------------
# インストール先を変更
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PGDATA=/usr/local/var/postgres

# ######################
# Autoloads
# ##########################################

# For function hooking
# -------------------------------------
autoload -Uz add-zsh-hook

# Vcs info provides us informations version control systems. (e.g. git, svn, cvs)
# -------------------------------------
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}(%s)%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-%c%u[%b|%a]%f'

# ######################
# Zsh Properties
# ##########################################

# 色を使用出来るようにする
autoload -Uz colors
colors

# lsで表示されるファイル・フォルダの色を見やすくする
# http://d.hatena.ne.jp/edvakf/20080413/1208042916
# -------------------------------------

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
#eval $(gdircolors ~/.zsh/dircolors.ansi-universal)
if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# プロンプトの左側の表示を変更
# -------------------------------------
# カレントディレクトリを表示
PROMPT="%{${fg[yellow]}%} %~
%# %{${reset_color}%}"

# プロンプトの右側の表示を変更
# -------------------------------------
# vcsの情報を表示
function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


# 大文字小文字関係なしに補完するように
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# C で標準出力をクリップボードにコピーできるようにする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
# -------------------------------------

if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

# よしなに補完してくれる
# brew install zsh-completions する必要あり
# -------------------------------------

if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

# chpwd内に書いたコマンドがcdするたびに実行される
# http://qiita.com/yuyuchu3333/items/b10542db482c3ac8b059
# -------------------------------------

chpwd() {
    ls_abbrev
}
# ls の全体像を表示
ls_abbrev() {
    if [[ ! -r $PWD ]]; then
        return
    fi
    # -a : Do not ignore entries starting with ..
    # -C : Force multi-column output.
    # -F : Append indicator (one of */=>@|) to entries.
    local cmd_ls='ls'
    local -a opt_ls
    opt_ls=('-aCF' '--color=always')
    case "${OSTYPE}" in
        freebsd*|darwin*)
            if type gls > /dev/null 2>&1; then
                cmd_ls='gls'
            else
                # -G : Enable colorized output.
                opt_ls=('-aCFG')
            fi
            ;;
    esac

    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

    if [ $ls_lines -gt 10 ]; then
        echo "$ls_result" | head -n 5
        echo '...'
        echo "$ls_result" | tail -n 5
        echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
    else
        echo "$ls_result"
    fi
}

#  do_enter内に書いたコマンドがReturnするたびに実行される
# http://qiita.com/yuyuchu3333/items/e9af05670c95e2cc5b4d
# -------------------------------------

function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls_abbrev
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo
    fi
    zle reset-prompt
    return 0
}
zle -N do_enter
bindkey '^m' do_enter

# catの代わりにcを使うといい感じにコードをシンタックスハイライトしてくれる。コードライン番号も表示させる
# http://qiita.com/zaru/items/4a7811ac21f74a13481c
# -------------------------------------
alias c='pygmentize -O style=monokai -f console256 -g'
function cl() {
    c $1 | nl -n ln -b a
  }
alias cl=cl
export LESS='-R'
export LESSOPEN='|lessfilter %s'


# ######################
# SSH
# ##########################################
# eval `ssh-agent`

