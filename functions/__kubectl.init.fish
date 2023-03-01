function __kubectl.init
  function __kubectl.create_abbr -d "Create Kubectl plugin abbreviation"
    set -l name $argv[1]
    set -l body $argv[2..-1]
    # global scope abbr is default in fish 3.6.0+
    abbr -a -g $name $body

    set -a __kubectl_plugin_abbreviations $name
  end

  # Provide a smooth transition from universal to global abbreviations by
  # deleting the old univeral ones.  Can be removed after fish 3.6 is in
  # wide-spread use, i.e. 2024.  __kubectl.destroy should also be removed
  # at the same time.
  if set -q __kubectl_plugin_initialized
    __kubectl.destroy
  end

  
  # kubectl abbreviations

  # This command is used a LOT both below and in daily life
  __kubectl.create_abbr k         kubectl

  # Execute a kubectl command against all namespaces
  #__kubectl.create_abbr kca       '_kca(){ kubectl "$@" --all-namespaces;  unset -f _kca; }; _kca'

  # Apply a YML file
  __kubectl.create_abbr kaf       kubectl apply -f

  # Drop into an interactive terminal on a container
  __kubectl.create_abbr keti      kubectl exec -ti

  # Manage configuration quickly to switch contexts between local, dev ad staging.
  __kubectl.create_abbr kcuc      kubectl config use-context
  __kubectl.create_abbr kcsc      kubectl config set-context
  __kubectl.create_abbr kcdc      kubectl config delete-context
  __kubectl.create_abbr kccc      kubectl config current-context
  __kubectl.create_abbr kcsccn    kubectl config set-context --current --namespace

  # List all contexts
  __kubectl.create_abbr kcgc      kubectl config get-contexts

  # General aliases
  __kubectl.create_abbr kdel      kubectl delete
  __kubectl.create_abbr kdelf     kubectl delete -f

  # Pod management.
  __kubectl.create_abbr kgp       kubectl get pods
  __kubectl.create_abbr kgpa      kubectl get pods --all-namespaces
  __kubectl.create_abbr kgpw      kubectl get pods --watch
  __kubectl.create_abbr kgpwide   kubectl get pods -o wide
  __kubectl.create_abbr kep       kubectl edit pods
  __kubectl.create_abbr kdp       kubectl describe pods
  __kubectl.create_abbr kdelp     kubectl delete pods

  # get pod by label: kgpl "app=myapp" -n myns
  __kubectl.create_abbr kgpl      kubectl get pods -l

  # get pod by namespace: kgpn kube-system"
  __kubectl.create_abbr kgpn      kubectl get pods -n

  # Service management.
  __kubectl.create_abbr kgs       kubectl get svc
  __kubectl.create_abbr kgsa      kubectl get svc --all-namespaces
  __kubectl.create_abbr kgsw      kubectl get svc --watch
  __kubectl.create_abbr kgswide   kubectl get svc -o wide
  __kubectl.create_abbr kes       kubectl edit svc
  __kubectl.create_abbr kds       kubectl describe svc
  __kubectl.create_abbr kdels     kubectl delete svc

  # Ingress management
  __kubectl.create_abbr kgi       kubectl get ingress
  __kubectl.create_abbr kgia      kubectl get ingress --all-namespaces
  __kubectl.create_abbr kei       kubectl edit ingress
  __kubectl.create_abbr kdi       kubectl describe ingress
  __kubectl.create_abbr kdeli     kubectl delete ingress

  # Namespace management
  __kubectl.create_abbr kgns      kubectl get namespaces
  __kubectl.create_abbr kens      kubectl edit namespace
  __kubectl.create_abbr kdns      kubectl describe namespace
  __kubectl.create_abbr kdelns    kubectl delete namespace
  #__kubectl.create_abbr kcn       kubectl config set-context $(kubectl config current-context) --namespace

  # ConfigMap management
  __kubectl.create_abbr kgcm      kubectl get configmaps
  __kubectl.create_abbr kgcma     kubectl get configmaps --all-namespaces
  __kubectl.create_abbr kecm      kubectl edit configmap
  __kubectl.create_abbr kdcm      kubectl describe configmap
  __kubectl.create_abbr kdelcm    kubectl delete configmap

  # Secret management
  __kubectl.create_abbr kgsec     kubectl get secret
  __kubectl.create_abbr kgseca    kubectl get secret --all-namespaces
  __kubectl.create_abbr kdsec     kubectl describe secret
  __kubectl.create_abbr kdelsec   kubectl delete secret

  # Deployment management.
  __kubectl.create_abbr kgd       kubectl get deployment
  __kubectl.create_abbr kgda      kubectl get deployment --all-namespaces
  __kubectl.create_abbr kgdw      kubectl get deployment --watch
  __kubectl.create_abbr kgdwide   kubectl get deployment -o wide
  __kubectl.create_abbr ked       kubectl edit deployment
  __kubectl.create_abbr kdd       kubectl describe deployment
  __kubectl.create_abbr kdeld     kubectl delete deployment
  __kubectl.create_abbr ksd       kubectl scale deployment
  __kubectl.create_abbr krsd      kubectl rollout status deployment
  #kres(){
  #    kubectl set env $@ REFRESHED_AT=$(date +%Y%m%d%H%M%S)
  #}

  # Rollout management.
  __kubectl.create_abbr kgrs      kubectl get rs
  __kubectl.create_abbr krh       kubectl rollout history
  __kubectl.create_abbr kru       kubectl rollout undo
  __kubectl.create_abbr krr       kubectl rollout restart

  # Statefulset management.
  __kubectl.create_abbr kgss      kubectl get statefulset
  __kubectl.create_abbr kgssa     kubectl get statefulset --all-namespaces
  __kubectl.create_abbr kgssw     kubectl get statefulset --watch
  __kubectl.create_abbr kgsswide  kubectl get statefulset -o wide
  __kubectl.create_abbr kess      kubectl edit statefulset
  __kubectl.create_abbr kdss      kubectl describe statefulset
  __kubectl.create_abbr kdelss    kubectl delete statefulset
  __kubectl.create_abbr ksss      kubectl scale statefulset
  __kubectl.create_abbr krsss     kubectl rollout status statefulset

  # Port forwarding
  __kubectl.create_abbr kpf       kubectl port-forward

  # Tools for accessing all information
  __kubectl.create_abbr kga       kubectl get all
  __kubectl.create_abbr kgaa      kubectl get all --all-namespaces

  # Logs
  __kubectl.create_abbr kl        kubectl logs
  __kubectl.create_abbr kl1h      kubectl logs --since 1h
  __kubectl.create_abbr kl1m      kubectl logs --since 1m
  __kubectl.create_abbr kl1s      kubectl logs --since 1s
  __kubectl.create_abbr klf       kubectl logs -f
  __kubectl.create_abbr klf1h     kubectl logs --since 1h -f
  __kubectl.create_abbr klf1m     kubectl logs --since 1m -f
  __kubectl.create_abbr klf1s     kubectl logs --since 1s -f

  # File copy
  __kubectl.create_abbr kcp       kubectl cp

  # Node Management
  __kubectl.create_abbr kgno      kubectl get nodes
  __kubectl.create_abbr keno      kubectl edit node
  __kubectl.create_abbr kdno      kubectl describe node
  __kubectl.create_abbr kdelno    kubectl delete node

  # PVC management.
  __kubectl.create_abbr kgpvc     kubectl get pvc
  __kubectl.create_abbr kgpvca    kubectl get pvc --all-namespaces
  __kubectl.create_abbr kgpvcw    kubectl get pvc --watch
  __kubectl.create_abbr kepvc     kubectl edit pvc
  __kubectl.create_abbr kdpvc     kubectl describe pvc
  __kubectl.create_abbr kdelpvc   kubectl delete pvc

  # Cleanup declared functions
  functions -e __kubectl.create_abbr
end
