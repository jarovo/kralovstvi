# kralovstvi


## VIM
### Set czech spellchecking in vim:

     :set spelllang=cs_CZ
     :set spell

vim should ask for downloading the spellchecking dictionary file.



### Test in docker image:

    sudo docker build -t jhenner_base -f Dockerfile .
    sudo docker build -t jhenner_base -f Dockerfile.workstation .
