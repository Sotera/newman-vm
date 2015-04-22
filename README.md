# newman-vm

provisions for creating a VM to run Newman

## Prebuild alpha

- Download [https://www.dropbox.com/s/2uynk59n0scl19v/newman-vm-v1.1.1.box?dl=0](https://www.dropbox.com/s/2uynk59n0scl19v/newman-vm-v1.1.1.box?dl=0)
- Create the VM<br/>
```bash
$ vagrant box add --name newman-vm-v1.1.1 newman-vm-v1.1.1.box
$ mkdir newman-vm
$ cd newman-vm
$ vagrant init newman-vm-v1.1.1
$ vagrant ssh -c "tangelo start"
```
- Ingest your GMail
  [http://localhost:8787/ingest.html](http://localhost:8787/ingest.html)
  

## Building

```bash
$ git clone https://github.com/Sotera/newman-vm.git
$ cd newman-vm
$ vagrant up
```

## Enable IMAP on gmail

[https://support.google.com/mail/troubleshooter/1668960?hl=en#ts=1665018](https://support.google.com/mail/troubleshooter/1668960?hl=en#ts=1665018)
