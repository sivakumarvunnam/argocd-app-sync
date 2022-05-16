# ArgoCD App Sync Action

Sync an app on ArgoCD.

## Inputs

### `server`

**Required** ArgoCD Server Endpoint

### `auth_token`

**Required** ArgoCD Auth Token

### `app`

**Required** ArgoCD App Name

## Outputs

### `env_url`

App Environment URL

###
```- name: argocd sync
   uses: sivakumarvunnam/argocd-app-sync@main # Uses an action in the root directory
   id: deployment-sync
   with:
     server: ${server}
     cli_server: latest
     auth_token: ${secret.ARGOCD_PASSWORD}
     app: ${{needs.build-and-push-docker-image.outputs.service_name}}
```
