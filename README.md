## Vagrant-NodeJS-Socket.IO Base Setup ##

### Required Software ###

Install the latest versions of the following applications:

1. Oracle VirtualBox Manager ([Link](https://www.virtualbox.org/wiki/Downloads))
2. Vagrant ([Link](http://www.vagrantup.com/downloads.html))
3. Vagrant Host Manager ([Link](https://github.com/smdahlen/vagrant-hostmanager))

### Initializing the Virtual Machine ###

1. Navigate to the root of the project folder in the terminal
2. Run the command: **vagrant up**

##### Socket.IO Application (socket.io) #####

Host: socketio.vagrant.vm

#### Application Logs ####

Logs for each application are written to the directory:

/logs

1. Forever logs: socketio_forever.log
2. NodeJS stdout logs: socketio_stdout.log
3. NodeJS stderr logs: socketio_stderr.log