###########################################################
#
# Base image with Node.js and unoconv
#
###########################################################

# Setting the base to nodejs 4.7.3
FROM node:4.9.1-slim@sha256:41d0ad2557ea2a9e57e1a458c1d659e92f601586e07dcffef74c9cef542f6f6e

# Maintainer
MAINTAINER Geir Gåsodden

# Adds backports
RUN awk '$1 ~ "^deb" { $3 = $3 "-backports"; print; exit }' /etc/apt/sources.list > /etc/apt/sources.list.d/backports.list

# Installs git and unoconv
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get -t jessie-backports install -y git unoconv && apt-get clean

ENTRYPOINT /usr/bin/unoconv --listener --server=0.0.0.0 --port=2002