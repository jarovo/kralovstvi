FROM fedora

RUN dnf install -y  \
    sudo \
	util-linux-user \
	findutils \
	gvim qgit zsh

RUN mkdir /home/jhenner

ENV KRALOVSTVI=/kralovstvi
COPY . $KRALOVSTVI
RUN KRALOVSTVI=${KRALOVSTVI} /kralovstvi/scripts/bootstrap.sh
