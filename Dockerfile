###########################################################
#
# Base image with Node.js and unoconv
#
###########################################################

# Setting the base to nodejs 4.7.3
FROM node:16.6.2-slim@sha256:879312d60a9f12d9e4d32af69364ab6f67c68af9ed4f145405d423f11fd2e804

# Maintainer
MAINTAINER Geir Gåsodden

# Adds backports
RUN awk '$1 ~ "^deb" { $3 = $3 "-backports"; print; exit }' /etc/apt/sources.list > /etc/apt/sources.list.d/backports.list

# Installs git and unoconv
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get -t jessie-backports install -y git unoconv && apt-get clean

ENTRYPOINT /usr/bin/unoconv --listener --server=0.0.0.0 --port=2002