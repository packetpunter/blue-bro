FROM blue-centos-base:latest
ENV workdir /app/code
ENV brodir /app/bro
RUN mkdir -p $workdir/pcaps
RUN mkdir -p $workdir/shortcuts
RUN mkdir -p $brodir/logs
RUN mkdir -p $brodir/spool
ADD ./shortcuts $workdir/shortcuts
RUN yum -y update; yum -y install which wget unzip
RUN cd /etc/yum.repos.d/; wget http://download.opensuse.org/repositories/network:bro/CentOS_7/network:bro.repo; yum -y install bro wireshark
RUN cd $workdir
ADD broconf/broctl.cfg /opt/bro/etc/broctl.cfg
WORKDIR $workdir
ENTRYPOINT /bin/pwsh
