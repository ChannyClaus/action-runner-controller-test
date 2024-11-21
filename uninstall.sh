set -eux
# https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners-with-actions-runner-controller/deploying-runner-scale-sets-with-actions-runner-controller#upgrading-arc
helm uninstall arc-runner-set \
    --wait \
    --namespace arc-runners \
    --ignore-not-found
helm uninstall large-arc-runner-set \
    --wait \
    --namespace large-arc-runners \
    --ignore-not-found
helm uninstall arc \
    --wait \
    --namespace arc-systems \
    --ignore-not-found

kubectl get crds -oname | grep "actions.github.com" | xargs kubectl delete
