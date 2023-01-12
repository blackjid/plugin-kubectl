function _kubectl_init --on-event fish_prompt
  __kubectl.init
end

function _kubectl_update --on-event kubectl_update
  __kubectl.reset
end

function _kubectl_uninstall --on-event kubectl_uninstall
  __kubectl.destroy
end