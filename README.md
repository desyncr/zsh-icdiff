# Zsh Icdiff

Wrapper around [icdiff](https://github.com/jeffkaufman/icdiff) to easily install as a antigen bundle:

    antigen bundle desyncr/zsh-icdiff

This will install the bundle as well as `icdiff` from `jeffkaufman/icdiff`.
By default it'll autoconfigure `icdiff` as a git difftool.

You should be able to call icdiff function from anywhere.

## Options

    `ICDIFF_OPTIONS`: Options passed to `icdiff` tool

    `ICDIFF_PLUGIN_GIT_DIFFTOOL`: Whether to auto configure git to use `icdiff` as diff tool
