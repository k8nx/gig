#!/bin/bash
INSTALL_PREFIX=${INSTALL_PREFIX-"/usr/local/bin"}
REPO_HOME=${REPO_HOME-"https://github.com/dgkim84/gig"}
BRANCH=${BRANCH-"master"}
NAME="git-ext-ignore"
MAINFILE="git-ignore"
SCRIPTS=("git-ignore-env" \
  "git-ignore-init" \
  "git-ignore-apply" \
  "git-ignore-add" \
  "git-ignore-update" \
)

if [ -d "$NAME" -a -d "$NAME/.git" ]; then
  echo "exist repository"
else
  git clone $REPO_HOME $NAME --branch $BRANCH
fi

install -v -d -m 0755 "$INSTALL_PREFIX"
install -v -m 0755 "$NAME/contrib/git-bash-ext/$MAINFILE" "$INSTALL_PREFIX"
for SCRIPT in ${SCRIPTS[@]}; do
  install -v -m 0644 "$NAME/contrib/git-bash-ext/$SCRIPT" "$INSTALL_PREFIX"
done
