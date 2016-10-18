Ansible Demo
====================


In this demo you can find:

  * hosts.sh
    * script that you can use to create docker based hosts. You can controll those hosts using ansible
  * Dockerfile
    * to build docker image for the demo hosts
  * hosts
    * file specifying the IPs of started docker hosts.
  * ansible.cfg
    * ansible configuration


Steps to do
-----------------

* add your ssh public key to **.ssh/authorized_keys** (be default there is .ssh/authorized_keys_example)
* build the docker host images by **docker build -t ubuntu-sshd .**
* start the docker containers by **./hosts.sh start**
* obtain IPs by **./hosts.sh IPs**
* place the IPs into the **hosts** file (and sort them in some groups)
* start to play with ansible (**ansible -i hosts -u root all -m ping**)
