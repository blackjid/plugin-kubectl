# kubectl initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies

set -q __kubectl_plugin_abbreviations; and exit 0

set -U __kubectl_plugin_abbreviations

function __kubectl_abbr -d "Create Kubectl plugin abbreviation"
  set -l name $argv[1]
  set -l body $argv[2..-1]
  abbr -a $name $body
  set __kubectl_plugin_abbreviations $__kubectl_plugin_abbreviations $name
end

# kubectl abbreviations

# This command is used a LOT both below and in daily life
__kubectl_abbr k         kubectl

# Execute a kubectl command against all namespaces
#__kubectl_abbr kca       '_kca(){ kubectl "$@" --all-namespaces;  unset -f _kca; }; _kca'

# Apply a YML file
__kubectl_abbr kaf       kubectl apply -f

# Drop into an interactive terminal on a container
__kubectl_abbr keti      kubectl exec -ti

# Manage configuration quickly to switch contexts between local, dev ad staging.
__kubectl_abbr kcuc      kubectl config use-context
__kubectl_abbr kcsc      kubectl config set-context
__kubectl_abbr kcdc      kubectl config delete-context
__kubectl_abbr kccc      kubectl config current-context
__kubectl_abbr kcsccn      kubectl config set-context --current --namespace

# List all contexts
__kubectl_abbr kcgc      kubectl config get-contexts

# General aliases
__kubectl_abbr kdel      kubectl delete
__kubectl_abbr kdelf     kubectl delete -f

# Pod management.
__kubectl_abbr kgp       kubectl get pods
__kubectl_abbr kgpa      kubectl get pods --all-namespaces
__kubectl_abbr kgpw      kubectl get pods --watch
__kubectl_abbr kgpwide   kubectl get pods -o wide
__kubectl_abbr kep       kubectl edit pods
__kubectl_abbr kdp       kubectl describe pods
__kubectl_abbr kdelp     kubectl delete pods

# get pod by label: kgpl "app=myapp" -n myns
__kubectl_abbr kgpl      kubectl get pods -l

# get pod by namespace: kgpn kube-system"
__kubectl_abbr kgpn      kubectl get pods -n

# Service management.
__kubectl_abbr kgs       kubectl get svc
__kubectl_abbr kgsa      kubectl get svc --all-namespaces
__kubectl_abbr kgsw      kubectl get svc --watch
__kubectl_abbr kgswide   kubectl get svc -o wide
__kubectl_abbr kes       kubectl edit svc
__kubectl_abbr kds       kubectl describe svc
__kubectl_abbr kdels     kubectl delete svc

# Ingress management
__kubectl_abbr kgi       kubectl get ingress
__kubectl_abbr kgia      kubectl get ingress --all-namespaces
__kubectl_abbr kei       kubectl edit ingress
__kubectl_abbr kdi       kubectl describe ingress
__kubectl_abbr kdeli     kubectl delete ingress

# Namespace management
__kubectl_abbr kgns      kubectl get namespaces
__kubectl_abbr kens      kubectl edit namespace
__kubectl_abbr kdns      kubectl describe namespace
__kubectl_abbr kdelns    kubectl delete namespace
#__kubectl_abbr kcn       kubectl config set-context $(kubectl config current-context) --namespace

# ConfigMap management
__kubectl_abbr kgcm      kubectl get configmaps
__kubectl_abbr kgcma     kubectl get configmaps --all-namespaces
__kubectl_abbr kecm      kubectl edit configmap
__kubectl_abbr kdcm      kubectl describe configmap
__kubectl_abbr kdelcm    kubectl delete configmap

# Secret management
__kubectl_abbr kgsec     kubectl get secret
__kubectl_abbr kgseca    kubectl get secret --all-namespaces
__kubectl_abbr kdsec     kubectl describe secret
__kubectl_abbr kdelsec   kubectl delete secret

# Deployment management.
__kubectl_abbr kgd       kubectl get deployment
__kubectl_abbr kgda      kubectl get deployment --all-namespaces
__kubectl_abbr kgdw      kubectl get deployment --watch
__kubectl_abbr kgdwide   kubectl get deployment -o wide
__kubectl_abbr ked       kubectl edit deployment
__kubectl_abbr kdd       kubectl describe deployment
__kubectl_abbr kdeld     kubectl delete deployment
__kubectl_abbr ksd       kubectl scale deployment
__kubectl_abbr krsd      kubectl rollout status deployment
#kres(){
#    kubectl set env $@ REFRESHED_AT=$(date +%Y%m%d%H%M%S)
#}

# Rollout management.
__kubectl_abbr kgrs      kubectl get rs
__kubectl_abbr krh       kubectl rollout history
__kubectl_abbr kru       kubectl rollout undo
__kubectl_abbr krr       kubectl rollout restart

# Statefulset management.
__kubectl_abbr kgss      kubectl get statefulset
__kubectl_abbr kgssa     kubectl get statefulset --all-namespaces
__kubectl_abbr kgssw     kubectl get statefulset --watch
__kubectl_abbr kgsswide  kubectl get statefulset -o wide
__kubectl_abbr kess      kubectl edit statefulset
__kubectl_abbr kdss      kubectl describe statefulset
__kubectl_abbr kdelss    kubectl delete statefulset
__kubectl_abbr ksss      kubectl scale statefulset
__kubectl_abbr krsss     kubectl rollout status statefulset

# Port forwarding
__kubectl_abbr kpf       kubectl port-forward

# Tools for accessing all information
__kubectl_abbr kga       kubectl get all
__kubectl_abbr kgaa      kubectl get all --all-namespaces

# Logs
__kubectl_abbr kl        kubectl logs
__kubectl_abbr kl1h      kubectl logs --since 1h
__kubectl_abbr kl1m      kubectl logs --since 1m
__kubectl_abbr kl1s      kubectl logs --since 1s
__kubectl_abbr klf       kubectl logs -f
__kubectl_abbr klf1h     kubectl logs --since 1h -f
__kubectl_abbr klf1m     kubectl logs --since 1m -f
__kubectl_abbr klf1s     kubectl logs --since 1s -f

# File copy
__kubectl_abbr kcp       kubectl cp

# Node Management
__kubectl_abbr kgno      kubectl get nodes
__kubectl_abbr keno      kubectl edit node
__kubectl_abbr kdno      kubectl describe node
__kubectl_abbr kdelno    kubectl delete node

# PVC management.
__kubectl_abbr kgpvc     kubectl get pvc
__kubectl_abbr kgpvca    kubectl get pvc --all-namespaces
__kubectl_abbr kgpvcw    kubectl get pvc --watch
__kubectl_abbr kepvc     kubectl edit pvc
__kubectl_abbr kdpvc     kubectl describe pvc
__kubectl_abbr kdelpvc   kubectl delete pvc

# Cleanup declared functions
functions -e __kubectl_abbr

# Mark kubectl plugin as initialized
set -U __kubectl_plugin_initialized (date)
