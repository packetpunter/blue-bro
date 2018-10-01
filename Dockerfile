FROM blue-centos-base:latest
ENV workdir /app/code
RUN mkdir -p $workdir/pcaps
RUN mkdir -p $workdir/shortcuts
RUN mkdir -p $workdir/logs
ADD ./shortcuts $workdir/shortcuts
RUN yum -y update; yum -y install which wget unzip
RUN cd /etc/yum.repos.d/
RUN wget http://download.opensuse.org/repositories/network:bro/CentOS_7/network:bro.repo
RUN -y yum install bro
RUN cd $workdir
RUN pip2 install pysubnettree
WORKDIR $workdir
ENTRYPOINT /bin/pwsh
