#!/bin/bash -e -x

IMAGE="https://download.fedoraproject.org/pub/fedora/linux/releases/27/CloudImages/x86_64/images/Fedora-Cloud-Base-27-1.6.x86_64.qcow2"

[ -r fcb.qcow2 ] || curl -SL "$IMAGE" -o fcb.qcow2
qemu-img create -b fcb.qcow2 fcb.snap 
qemu-kvm -hda fcb.snap -vga std
