FROM blue-centos-base:latest
ENV workdir /app/code
RUN mkdir -p $workdir/pcaps
RUN mkdir -p $workdir/shortcuts
RUN mkdir -p $workdir/logs
ADD ./shortcuts $workdir/shortcuts
RUN yum -y install bro; yum -y install gcc gcc-c++ python2-pip python-devel; yum -y clean all; yum -y update
RUN pip2 install pysubnettree
RUN git clone git://git.bro.org/trace-summary.git $workdir/utils/trace-summary
WORKDIR $workdir
ENTRYPOINT /bin/bash
