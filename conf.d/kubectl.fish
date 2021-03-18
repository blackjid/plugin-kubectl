function _kubectl_install --on-event kubectl_install
  __kubectl.init
end

function _kubectl_update --on-event kubectl_update
  __kubectl.reset
end

function _kubectl_uninstall --on-event kubectl_uninstall
  __kubectl.destroy
end