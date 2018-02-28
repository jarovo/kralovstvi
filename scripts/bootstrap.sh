#!/bin/bash -x

sudo dnf install -y  \
	util-linux-user \
	gvim qgit zsh 

chsh -s /bin/zsh

