# Use latest opensuse image as the base
FROM opensuse

MAINTAINER Raúl Romero García <rromerogar@uoc.edu>

LABEL version="1.0.0"
LABEL description="Lastest opensuse docker image with RVM"
RUN chsh -s /bin/bash
RUN zypper -n ar http://download.opensuse.org/repositories/devel:/languages:/ruby:/extensions/openSUSE_Leap_42.1/ Devel:Languages:Ruby:Extensions
RUN zypper -n --gpg-auto-import-keys ref Devel:Languages:Ruby:Extensions
RUN zypper -n in curl which tar
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN echo insecure >> ~/.curlrc
RUN curl -sSL --insecure https://get.rvm.io | bash -s stable
RUN source /etc/profile.d/rvm.sh

ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
