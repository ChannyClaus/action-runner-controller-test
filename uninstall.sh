set -eux
# https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners-with-actions-runner-controller/deploying-runner-scale-sets-with-actions-runner-controller#upgrading-arc
helm uninstall arc-runner-set --wait
helm uninstall large-arc-runner-set --wait
helm uninstall arc

kubectl get crds -oname | grep "actions.github.com" | xargs kubectl delete
