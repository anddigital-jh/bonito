FROM --platform=linux/amd64 python:3.7.12-slim-bullseye

WORKDIR /home/app

# Enable non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

## Update Distro
RUN apt update -y && apt-get update -y

## Core Dependencies
RUN apt install curl sudo lsof git -y

## App Dependencies
RUN pip3 install ont-bonito

## Clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT /bin/bash
