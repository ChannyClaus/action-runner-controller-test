set -eux

GITHUB_CONFIG_URL=https://github.com/ChannyClaus/action-runner-controller-test

helm install arc \
    --namespace "arc-systems" \
    --create-namespace \
    --set metrics.controllerManagerAddr=":8080" \
    --set metrics.listenerAddr=":8080" \
    --set metrics.listenerEndpoint="/metrics" \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set-controller

helm install "arc-runner-set" \
    --namespace "arc-runners" \
    --create-namespace \
    --set githubConfigUrl="${GITHUB_CONFIG_URL}" \
    --set githubConfigSecret.github_token="${GITHUB_PAT}" \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set

helm install "large-arc-runner-set" \
    --namespace "large-arc-runners" \
    --create-namespace \
    --set githubConfigUrl="${GITHUB_CONFIG_URL}" \
    --set githubConfigSecret.github_token="${GITHUB_PAT}" \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set
