# A Dockerfile to build a development environment for
#
#         MM                       MMMMM
#            MM                    MMMMMMM        MMM
#                MMMM              MMMMMMMMM    MMMMM         MMMMMMMMMM
#                    MM             MMMMMMMMM MMM  MM    MMMMMMMMMMMMMMM
#        MMMMMM       M              MMMMMMMMMM    MM MMMMMMMMMMMMMMMMMM
#              MM     M                MMMMMMMMM   MMMMMMMMMMMMMMMMMMMM
#                MM  MMM        M       MMMMMMMMMMMMMMMMMMMMMMMMMMMMM
#              MMMMMMMMMMMMM   MMMM       MMMMMMMMMMMMMMMMMMMMMMMMM
#             MMMMMMMMMMMMMM  MMM MMMM   MMMMMMMMMMMMMMMMMMMMMMMM
#             MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
#           MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
#          MMMMMMMMMMMMM   MMMMMMMMMMMMMMMM MMMMMMMMMMMMMMM   MMMMMMMM
#          M  MMMM   MM    MMMMMMMM MMMMM     MMMMMMMMMMMMMMM       MM
#            MMM    MM     MM   MMM   MMMM            MMMMMMMMM      MM
#                  MM      M MMMMM       MMMMMM         MMMMMMMMMM    MM
#                MMM    MMMMMM               MMMM       M MMMMMMMMMMMM MM
#              MMM      MM M                  MM        MM   MMMMMMMMMMMMM
#           MMM        MM  M                 MM         MM     MMMMMMMMMMMMMMM
#         MM          MM   M               MM            MM       MMMMMMMMMMMMMM
#       MMM         MM    MM            MMM               MMMM      MMMMMMMMMMMM
#    MMM      MMM MMMMMMMMMMMMMMMMMMMM MMMMMMMMMMMMMMMMMMM  MM    MMM MMMMMMMMMM
#    MMM      MMM MMMMMMMMMMMMMMMMMMMM MMMMMMMMM MMMMMMMMM  MMMM  MMM MMMMMMMMMM
#    MMM          MMM    MMMMMM    MMM MMM   MMM   MMM MMM  MMMMMMMMM    MMMMMMM
#    MMM      MMM MMMMMMMMM MMM    MMM MMMMMMMMM  MMM  MMM  MM MMMMMM    MMMM
#    MMM      MMM MMMMMMMMMMMMMMMMMMMM MMMMMMMMM  MM   MMM  MM    MMM    MMMM
#    MMM   MM MMM MMM    MMMMMM  MMM   MMM        MMMMMMMM  MM    MMM    MMMM
#    MMMMMMMM MMM MMMMMMMMMMMMM   MMM  MMMMMMMMM  MM   MMM  MM    MMM    MMMM
#    MMMMMMMM MMM MMMMMMMMMMMMM   MMM  MMMMMMMMM  MM   MMM  MM    MMM    MMMM
#
#
# To build run the following from the root of the libreant directory:
#
#  docker build -t libreant-box .
#
# To start the container and operate inside it run:
#
#  docker run --privileged --rm -ti $PWD:/libreant libreant-box
#
FROM debian:stretch

RUN apt-get update && apt-get install -y \
    systemd wget gnupg apt-transport-https \
    python2.7 gcc python2.7-dev python-virtualenv
# Add ES gpg key for their repository
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch|tee /tmp/ES.key|\
    gpg -|grep -q "46095ACC8548582C1A2699A9D27D666CD88E42B4" &&\
    cat /tmp/ES.key|apt-key add -
RUN echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" |\
    tee -a /etc/apt/sources.list.d/elastic-6.x.list
RUN apt-get update && apt-get install -y \
    # install ES version 6 and python2 requirements
    openjdk-8-jre-headless elasticsearch
# Copy libreant directory to /libreant into the container
ADD . /libreant
WORKDIR /libreant
# Coping the SysVint script to appropriate directory
RUN mv libreantd /etc/init.d/
# Installing libreant
RUN virtualenv -p  $(which python2) ve && ./ve/bin/pip install -e . &&\
    # Installing fsdb ;)
    ./ve/bin/pip install Fsdb
RUN mkdir /fdsb-store

EXPOSE 5000

ENTRYPOINT service elasticsearch start && service libreantd start && bash -i
