#!/bin/bash
# Pass the name of a service to check ie: sh check-deployment.sh staging-voting-app-vote
# Will run forever...
deployment_status=""
while [ "$deployment_status" != "True" ]; do
  echo "Waiting for Deployment to be Available..."
  deployment_status=$(kubectl get deployment $1 -o jsonpath='{.status.conditions[?(@.type=="Available")].status}')
  [ "$deployment_status" != "True" ] && sleep 5
done
echo 'Deployment is Available!'