# KaNaPi project

Main goal of this project is to create educational operating system based on Linux kernel
and free software for use at home.

Current phase: Beta

Versions: 
* in development - v0.9
* released - v0.8

License: GPL v.3

Look into doc directory to learn how to build KaNaPi.
More details on http://kanapi.ga

Author: jacek.m.danecki@gmail.com

## Development workflow

## SBS images

SBS images on SourceForge https://sourceforge.net/projects/kanapi/files/images/v0.9/
* sbs-x86_64.tar.xz - base for build in chroot (local and CI)
* sbs-docker-x86.tar.xz - base for BBS docker image

## Docker images

* SBS image - https://hub.docker.com/r/kanapi/kanapi-sbs
* BBS image - https://hub.docker.com/r/kanapi/kanapi-bbs
* CLI image - https://hub.docker.com/r/kanapi/kanapi-cli

## System build workflow

* Sbs - small build system: kanapi_system/kanapi-sbs
* Bbs - base build system, built on top of Sbs: kanapi_system/kanapi-bbs
* Cli - command line tools built on top of Bbs: kanapi_system/kanapi-cli
* X11 - X11 support, libs, apps, built on top of Cli: kanapi_system/kanapi-x11
* Gui - Gtk2/3 and Qt support, libs built on top of X11: kanapi_system/kanapi-gui
* Apps - Applications and libs built on top Gui: kanapi_system/kanapi-apps

## CI systems

## Builds executed in chroot with SBS image
* SemaphoreCI - build BBS and CLI packages, https://semaphoreci.com/jdanecki/kanapi
* Shippable - build BBS and part of CLI packages, https://app.shippable.com/github/jdanecki/kanapi/dashboard
  (deprecated by docker build)

## Builds using native (Ubuntu 14.0 compilers) without SBS (BBS only)

* CircleCI - https://circleci.com/gh/jdanecki/kanapi
* CodeShip - https://app.codeship.com/projects/191185

## Builds in docker container

* Shippable 
  - build cli docker image from BBS docker image from https://hub.docker.com/r/kanapi/kanapi-bbs
  - docker builds: https://app.shippable.com/github/jdanecki/kanapi-dockers/dashboard
* Travis 
  - build SBS from sbs-docker tarball and BBS from SBS docker image, https://travis-ci.org/jdanecki/kanapi
  - docker builds: https://travis-ci.org/jdanecki/kanapi-dockers/builds/355665885
* SemaphoreCI
  - docker builds: https://semaphoreci.com/jdanecki/kanapi-dockers/

## Repositories

* Main KaNaPi - https://github.com/jdanecki/kanapi
* KaNaPi Gui - https://github.com/jdanecki/kanapi-gui
* KaNaPi Apps - https://github.com/jdanecki/kanapi-apps
* KaNaPi CI tests: https://github.com/jdanecki/kanapi-ci
* CI tests: https://github.com/jdanecki/ci-tests
* KaNaPi CI tests on shippable only: https://github.com/jdanecki/kanapi-shippable
* KaNaPi docker tests: https://github.com/jdanecki/kanapi-dockers

