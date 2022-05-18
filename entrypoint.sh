#!/bin/sh -l

set -e

echo "==> Fetching argocd cli..."
curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/${ARGOCD_CLI_SERVER}/download/argocd-linux-amd64
chmod +x /usr/local/bin/argocd

HTTP_CODE=$(curl --write-out "%{http_code}\n" "https://${ARGOCD_SERVER}" --output output.txt --silent)
echo "==> ArgoCD server status code :" $HTTP_CODE

if [ -z $HTTP_CODE ]; then
    echo "==> ArgoCD endpoint is not available"
    exit 0
else
    echo "==> Login to ArgoCD UI..."
    argocd login $ARGOCD_SERVER --username admin --password $ARGOCD_AUTH_TOKEN --insecure --grpc-web
fi

echo "==> Syncing app..."
argocd app sync $1

echo "==> Waiting for app to become healthy..."
argocd app wait $1

echo "==> Generating app env url output..."
#env_url=$(argocd app get $1 -o json | jq -r '.status.summary.externalURLs | sort_by(length) | .[0]')
#echo "::set-output name=env_url::${env_url}"
