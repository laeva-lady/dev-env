#! /usr/bin/bash

modprobe vboxdrv

sudo rmmod kvm_intel
sudo rmmod kvm
