export ICDIFF_BIN_PATH=${0:A:h}/icdiff
icdiff () {
    $ICDIFF_BIN_PATH/icdiff "$@"
}
