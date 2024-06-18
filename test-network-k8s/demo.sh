#!/bin/bash

rm -rf build
kubectl delete namespace test-network

export TEST_NETWORK_CLUSTER_RUNTIME="minikube"

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
curl -s --header "X-Api-Key: ${SAMPLE_APIKEY}" http://fabric-rest-sample.localho.st/api/assets

