###########################################################
#
# Base image with Node.js and unoconv
#
###########################################################

# Setting the base to nodejs 4.7.3
FROM node:26.13.1-slim@sha256:abe7e5a82b61a8ef67b315b85497c9e65173387ccf2f4a029248184b8e020be5

# Maintainer
MAINTAINER Geir Gåsodden

# Adds backports
RUN awk '$1 ~ "^deb" { $3 = $3 "-backports"; print; exit }' /etc/apt/sources.list > /etc/apt/sources.list.d/backports.list

# Installs git and unoconv
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get -t jessie-backports install -y git unoconv && apt-get clean

ENTRYPOINT /usr/bin/unoconv --listener --server=0.0.0.0 --port=2002