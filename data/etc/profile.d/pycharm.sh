# shellcheck shell=sh

# Expand $PATH to include the directory where pycharm is.
pycharm_bin_path="/opt/pycharm/bin"
if [ -n "${PATH##*${pycharm_bin_path}}" ] && [ -n "${PATH##*${pycharm_bin_path}:*}" ]; then
    export PATH=$PATH:${pycharm_bin_path}
fi
