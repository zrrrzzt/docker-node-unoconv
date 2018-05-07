###########################################################
#
# Base image with Node.js and unoconv
#
###########################################################

# Setting the base to nodejs 4.7.3
FROM node:4.7.3-slim@sha256:9267e8076c6a7f46762a019c0fdbe9299ae1425eacbcf8dad0482daa8d010187

# Maintainer
MAINTAINER Geir Gåsodden

# Adds backports
RUN awk '$1 ~ "^deb" { $3 = $3 "-backports"; print; exit }' /etc/apt/sources.list > /etc/apt/sources.list.d/backports.list

# Installs git and unoconv
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get -t jessie-backports install -y git unoconv && apt-get clean

ENTRYPOINT /usr/bin/unoconv --listener --server=0.0.0.0 --port=2002