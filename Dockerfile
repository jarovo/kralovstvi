FROM fedora
COPY .git /kralovstvi 
#RUN dnf install -y git
RUN /kralovstvi/scripts/bootstrap.sh
