FROM fedora
COPY .git /kralovstvi 
RUN scripts/bootstrap.sh
RUN git checkout /kralovstvi
