# newman-vm

provisions for creating a VM to run Newman

## prebuild alpha

- Download [https://www.dropbox.com/s/03ol9bx726ya59a/newman-vm-v1.0.box?dl=0](https://www.dropbox.com/s/03ol9bx726ya59a/newman-vm-v1.0.box?dl=0)
- Create the VM<br/>
```bash
$ vagrant box add --name newman-vm-v1.0 newman-vm-v1.0.box
$ mkdir newman-vm
$ cd newman-vm
$ vagrant init newman-vm-v1.0
$ vagrant ssh -c "tangelo start"
```
- Ingest your GMail [http://localhost:8787/ingest.html](http://localhost:8787/ingest.html)



## Building

Start with [Sotera's XDATA-VM v0.2.1](https://github.com/Sotera/xdata-vm) 
Import this into vagrant named **xdata-0.2.1** (or modify the **config.vm.box** in the **Vagrantfile** to the correct name)

## Add Newman

```bash
cd /srv/software
git clone https://github.com/Sotera/newman
```

## Walker Emails

[https://www.dropbox.com/s/q9fydjmcon1l8me/kmrindfleisch%40gmail.com.tar.gz?dl=0](https://www.dropbox.com/s/q9fydjmcon1l8me/kmrindfleisch%40gmail.com.tar.gz?dl=0)

## Enable IMAP on gmail

[https://support.google.com/mail/troubleshooter/1668960?hl=en#ts=1665018](https://support.google.com/mail/troubleshooter/1668960?hl=en#ts=1665018)

**download your gmail**
```bash
cd /srv/software/newman
./src/gmail_download.py

## create a config for your email

printf 'EMAIL_TARGET="your_gmail@gmail.com"\n' > conf/your_cfg.cfg

## run
./bin/rebuild_all.sh
./bin/ingest.sh conf/your_cfg.cfg
```

**ingest walker emails**
```bash
cd /srv/software/newman/demail/emails/
wget -O - -o /dev/null https://www.dropbox.com/s/q9fydjmcon1l8me/kmrindfleisch%40gmail.com.tar.gz?dl=0 | tar -zxvf -

cd /srv/software/newman
./bin/rebuild_all.sh
./bin/ingest.sh conf/walker.cfg
```
