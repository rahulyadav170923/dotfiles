alias contexts=kubectl config get-contexts

kssh(){
    kubectl exec -it $(kubectl get pods --selector=app=$1 -o jsonpath='{.items[*].metadata.name}') -c $2 bash
}

kubectl_logs(){
    kubectl logs -f $(kubectl get pods --selector=app=$1 -o jsonpath='{.items[*].metadata.name}') -c $2 --tail=10
}

change_context(){
    if [[ "$1" == "prod" ]]; then
        kubectl config use-context prod.k8s.local
        return
    elif [[ "$1" == "stage" ]]; then
        kubectl config use-context stage.k8s.local
        return
    fi
    echo "not a correct context"
}

change_namespace(){
    kubectl config set-context $KUBE_PS1_CONTEXT --namespace=$1
}

# change_context(){
#     if [[ "" ]]
#     if [[ "$1" == "prod" ]]; then
#         kubectl config use-context prod.k8s.local
#         return
#     elif [[ "$1" == "stage" ]]; then
#         kubectl config use-context stage.k8s.local
#         return
#     fi
#     echo "not a correct context"
# }
