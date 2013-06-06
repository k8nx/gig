#!/bin/bash
INSTALL_PREFIX=${INSTALL_PREFIX-"/usr/local/bin"}
REPO_HOME=${REPO_HOME-"https://github.com/dgkim84/gig"}
GIG_PATH="/usr/local/lib/gig"
BRANCH=${BRANCH-"master"}
MAINFILE="git-ignore"
SCRIPTS=("git-ignore-env" \
  "git-ignore-init" \
  "git-ignore-apply" \
  "git-ignore-add" \
  "git-ignore-update" \
)

if [ -d "$GIG_PATH" -a -d "$GIG_PATH/.git" ]; then
  echo # pass
else
  git clone $REPO_HOME $GIG_PATH --branch $BRANCH
fi

install -v -d -m 0755 "$INSTALL_PREFIX"
install -v -m 0755 "$GIG_PATH/contrib/git-bash-ext/$MAINFILE" "$INSTALL_PREFIX"
for SCRIPT in ${SCRIPTS[@]}; do
  install -v -m 0644 "$GIG_PATH/contrib/git-bash-ext/$SCRIPT" "$INSTALL_PREFIX"
done
