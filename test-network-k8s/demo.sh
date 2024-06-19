#!/bin/bash

rm -rf build
kubectl delete namespace test-network

export TEST_NETWORK_CLUSTER_RUNTIME="minikube"
export TEST_NETWORK_CLUSTER_NAME="$HL_ENV"
export TEST_NETWORK_KUBE_NAMESPACE="$HL_K8S_NS"
export TEST_NETWORK_DOMAIN="$HL_DOMAIN"
export TEST_NETWORK_LOCAL_REGISTRY_NAME="$HL_REGISTRY_HOST"
export TEST_NETWORK_LOCAL_REGISTRY_PORT="$HL_REGISTRY_PORT"

./network up

./network channel create

./network chaincode deploy asset-transfer-basic ../asset-transfer-basic/chaincode-java

./network chaincode invoke asset-transfer-basic '{"Args":["InitLedger"]}'

./network chaincode query  asset-transfer-basic '{"Args":["ReadAsset","asset1"]}'

./network rest-easy

echo
echo Calling REST API
echo

sleep 5

export SAMPLE_APIKEY=97834158-3224-4CE7-95F9-A148C886653E
curl -s --header "X-Api-Key: ${SAMPLE_APIKEY}" http://fabric-rest-sample.${HL_DOMAIN}/api/assets
echo
