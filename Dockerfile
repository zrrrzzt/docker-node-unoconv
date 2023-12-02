###########################################################
#
# Base image with Node.js and unoconv
#
###########################################################

# Setting the base to nodejs 4.7.3
FROM node:21.3.0-slim@sha256:8d66ff8ac7f7053d707de87bc86ebfe8b4052e4fc8a9d3195e8f8441a247bd70

# Maintainer
MAINTAINER Geir Gåsodden

# Adds backports
RUN awk '$1 ~ "^deb" { $3 = $3 "-backports"; print; exit }' /etc/apt/sources.list > /etc/apt/sources.list.d/backports.list

# Installs git and unoconv
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get -t jessie-backports install -y git unoconv && apt-get clean

ENTRYPOINT /usr/bin/unoconv --listener --server=0.0.0.0 --port=2002