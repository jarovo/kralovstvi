# kralovstvi

# VPN access.

To access VPN follow [the source article about VPN access](https://redhat.service-now.com/help?id=kb_article_view&sysparm_article=KB0005424)


## VIM
### Set czech spellchecking in vim:

     :set spelllang=cs_CZ
     :set spell

vim should ask for downloading the spellchecking dictionary file.



### Test in docker image:

    sudo docker build -t jhenner_base -f Dockerfile .
    sudo docker build -t jhenner_base -f Dockerfile.workstation .
