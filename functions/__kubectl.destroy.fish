function __kubectl.destroy
  for ab in $__kubectl_plugin_abbreviations
      abbr -e $ab
  end
  set -Ue __kubectl_plugin_abbreviations
  set -Ue __kubectl_plugin_initialized
end