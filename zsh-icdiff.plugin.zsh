# Get the current path to be able to export it
ICDIFF_PLUGIN_PATH=${0:A:h}
# Whether to configure git difftool
ICDIFF_PLUGIN_GIT_DIFFTOOL=${ICDIFF_PLUGIN_GIT_DIFFTOOL:-true}
# icdiff submodule path
ICDIFF_PATH=$ICDIFF_PLUGIN_PATH/icdiff
# icdiff bin
ICDIFF_BIN_PATH=$ICDIFF_PATH/icdiff

# icdiff options, it's exported as to be used by icdiff-ext-tool
export ICDIFF_OPTIONS=${ICDIFF_OPTIONS:-"--line-numbers"}
# Adds current icdiff and plugin path to $PATH
export PATH="$PATH:$ICDIFF_PATH:$ICDIFF_PLUGIN_PATH"

# chmod to be executable
if [[ ! -x "$ICDIFF_BIN_PATH"  ]]; then
    chmod u+x "$ICDIFF_BIN_PATH" &> /dev/null
fi

# Configure git diff tool to be icdiff
current_git_difftool=$(git config --global diff.tool)
if [[ $ICDIFF_PLUGIN_GIT_DIFFTOOL == true && $current_git_difftool != 'icdiff'  ]]; then
    git config --global diff.tool "icdiff"
    git config --global diff.external "icdiff-ext-tool"
    git config --global difftool.icdiff.cmd "icdiff $ICDIFF_OPTIONS \$LOCAL \$REMOTE"
fi
