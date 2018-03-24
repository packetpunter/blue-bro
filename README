## Intro

This container is built using my other [docker base image](https://github.com/packetpunter/bro-centos), so it will have to be built into your docker image list before this image can run.

It is meant to be an on-the-fly analyzer for pcap files in the field using bro and some fancy shell scripts.

## Basic Usage

As described in the run.sh script, this image assumes there will be a folder ~/Documents/pcaps that contains PCAPs for analysis. Additionally, if you want the bro logs outside of the container, there must be a folder at ~/code/docker/blue-bro/logs. These map to their respective folders in /app/code.

## Utilities

This container runs in /app/code. There are utilities in /app/code/utils, like [trace-summary](https://www.bro.org/sphinx/components/trace-summary/README.html). There is also the bins for scapy3k in there.


