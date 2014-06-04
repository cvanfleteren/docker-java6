FROM phusion/baseimage:0.9.10

ENV HOME /root

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN /usr/sbin/enable_insecure_key

CMD ["/sbin/my_init"]

RUN apt-get update

RUN apt-get install software-properties-common -y

#install java, accept license
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java6-installer


RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



