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
COPY broctl.cfg /opt/bro/etc/
RUN pip3 install bro-pkg
RUN bro-pkg install --force bro/corelight/bro-long-connections
RUN bro-pkg refresh; bro-pkg install --force bro/corelight/top-dns
RUN bro-pkg refresh; bro-pkg install --force sethhall/unknown-mime-type-discovery
RUN bro-pkg refresh; bro-pkg install --force bro/corelight/bro-drwatson
WORKDIR $workdir
ENTRYPOINT /bin/pwsh
