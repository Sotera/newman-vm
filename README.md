# newman-vm

provisions for creating a VM to run Newman

## Prebuild alpha

- Download [Newman VM](https://www.dropbox.com/s/h0pyxjj3rlhodv0/newman-vm-v1.1.2.box?dl=0)
- Create the VM<br/>
```bash
$ vagrant box add --name newman-vm-v1.1.2 newman-vm-v1.1.2.box
$ mkdir newman-vm
$ cd newman-vm
$ vagrant init newman-vm-v1.1.2
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
