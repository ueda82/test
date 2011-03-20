# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/takuto/.zshrc'

autoload -Uz compinit
compinit

setopt auto_pushd
setopt auto_cd
setopt correct
setopt cdable_vars

# End of lines added by compinstall
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
#プロンプトの設定
#PROMPT="%/%% "
PROMPT='%n@%m:%(5~,%-2~/.../%2~,%~)%% '
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
#git
autoload -Uz add-zsh-hook
autoload -Uz colors
colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

autoload -Uz is-at-least
# if is-at-least 4.3.10; then
  # この check-for-changes が今回の設定するところ
#   zstyle ':vcs_info:git:*' check-for-changes true
#   zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
#   zstyle ':vcs_info:git:*' unstagedstr "-"  # 適当の文字列に変更する
#   zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
#   zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'
# fi

#function _update_vcs_info_msg() {
#    psvar=()
#    LANG=en_US.UTF-8 vcs_info
#    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
#}
#add-zsh-hook precmd _update_vcs_info_msg
#RPROMPT="%1(v|%F{green}%1v%f|)"
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"
