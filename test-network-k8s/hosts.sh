#!/bin/bash

IP=$(minikube ip)

cat <<EOF
$IP registry.$HL_DOMAIN

$IP org0-ca.hl-demo
$IP org0-orderer1-admin.hl-demo
$IP org0-orderer2-admin.hl-demo
$IP org0-orderer3-admin.hl-demo
$IP org0-orderer1.hl-demo
$IP org0-orderer2.hl-demo
$IP org0-orderer3.hl-demo

$IP org1-ca.hl-demo
$IP org1-peer1.hl-demo
$IP org1-peer2.hl-demo

$IP org2-ca.hl-demo
$IP org2-peer1.hl-demo
$IP org2-peer2.hl-demo

$IP fabric-rest-sample.hl-demo
EOF
