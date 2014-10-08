
# newman-vm

provisions for creating a VM to run Newman


Start with [Sotera's XDATA-VM v0.2.1](https://github.com/Sotera/xdata-vm) 
Import this into vagrant named **xdata-0.2.1** (or modify the **config.vm.box** in the **Vagrantfile** to the correct name)


## Add Newman

```
cd /srv/software
git clone https://github.com/Sotera/newman
```

## enable IMAP on gmail

[https://support.google.com/mail/troubleshooter/1668960?hl=en#ts=1665018](https://support.google.com/mail/troubleshooter/1668960?hl=en#ts=1665018)

**download your gmail**
```
cd /srv/software/newman
./src/gmail_download.py

## create a config for your email

printf 'EMAIL_TARGET="your_gmail@gmail.com"\n' > conf/your_cfg.cfg

## run
./bin/rebuild_all.sh
./bin/ingest.sh conf/your_cfg.cfg
```

**ingest walker emails **
```
cd newman
mkdir data/kmrindfleisch@gmail.com

## download sw_data.zip and unzip to data/kmrindfleisch@gmail.com/

cd /srv/software/newman

./bin/rebuild_all.sh
./bin/ingest.sh conf/walker.cfg
```
