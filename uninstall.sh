set -eux

helm uninstall arc-runner-set --wait
helm uninstall large-arc-runner-set --wait
helm uninstall arc
