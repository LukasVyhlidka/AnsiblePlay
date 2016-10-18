FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server && apt-get install -y python
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd

# Reconfiguration of SSHD
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin without-password/' /etc/ssh/sshd_config
RUN sed -i 's/#AuthorizedKeysFile	%h\/.ssh\/authorized_keys/AuthorizedKeysFile	%h\/.ssh\/authorized_keys/' /etc/ssh/sshd_config
RUN sed -i 's/StrictModes yes/StrictModes no/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
