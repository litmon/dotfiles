if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

# nvm
# これなんだろう
. ~/.nvm/nvm.sh
# node.jsのデフォルトバージョンを使う
nvm use default
# npmのディレクトリ場所
npm_dir=${NVM_PATH}_modules
# node_pathを読み込み？
export NODE_PATH=$npm_dir

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
# init rbenv
eval "$(rbenv init -)"

# git settings 
source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true

# ユーザー名のところを編集(gitリポジトリの状態を追加)
export PS1='\h:\W $(__git_ps1 "[\[\033[32m\]%s\[\033[0m\]]")\$ '
# fukuo:~ FukuoKadota$

# adbにパスを通す
export PATH="$PATH:/Users/FukuoKadota/android-sdks/platform-tools"

# android-ndkにパスを通す
export PATH="$PATH:/Users/FukuoKadota/android-ndk-r9b"
