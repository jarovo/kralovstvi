FROM fedora
COPY . /kralovstvi 
RUN dnf install -y sudo
RUN dnf install -y  \
	util-linux-user \
	findutils \
	gvim qgit zsh 
