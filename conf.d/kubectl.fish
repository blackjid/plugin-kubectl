# Remove Legacy hooks to precent errors on upgrade.
# This can be removed when we cleanup other universal abbr code.
functions -e _kubectl_uninstall

# fisher initialization, protected as omf also tries to run it.
set -q fisher_path; or set -l fisher_path $__fish_config_dir
if test -f $__fish_config_dir/functions/__kubectl.init.fish
  source $__fish_config_dir/functions/__kubectl.init.fish
  __kubectl.init
end
