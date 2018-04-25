#!/bin/bash
echo ============================================================================
echo "======================Deploying Platform Services...========================"
echo ============================================================================

/app/binaries/rancher ps

/app/binaries/rancher --debug up \
  --file /app/config/docker-compose.yml \
  --rancher-file /app/config/rancher-compose.yml \
  -d \
  -s platform \
  --upgrade \
  --pull

# TODO: Integrations tesst can be run here.
# TODO : Rollaback HERE if tests faild.

echo "=========================Cleaning up PlatformServices========================="

/app/binaries/rancher --debug up \
  --file /app/config/docker-compose-yml \
  --rancher-file /app/config/rancher-compose.yml \
  -d \
  -s platform \
  --confirm-upgrade


echo ============================================================================
echo ============================================================================
echo ============================================================================
echo "+++++++++++++++++++++++++Platform clean up complete+++++++++++++++++++++++++"
echo ============================================================================
echo ============================================================================
echo ============================================================================