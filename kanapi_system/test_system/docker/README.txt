How to use core-cli KaNaPi to build gui and media targets
=========================================================

1. kanapi_system/test_system/docker/update_bbs_docker
2. kanapi_system/test_system/docker/run_bbs_docker
3. In running container:
* /configure
* cd /kanapi_build/kanapi/kanapi_system/x86_64
* ./install t_gui verbose
* ./install t_media verbose

How to use BBS docker to build core-cli KaNaPi

==============================================

1. kanapi_system/test_system/docker/update_bbs_docker
2. kanapi_system/test_system/docker/run_bbs_docker
3. In running container:
* /configure
* cd /kanapi_build/kanapi/kanapi_system/x86_64
* ./install t_core_cli verbose

How to use SBS docker to build BBS
==================================

1. kanapi_system/test_system/docker/update_docker
2. kanapi_system/test_system/docker/run_docker
3. In running container:
* /configure
* cd /kanapi_build/kanapi/kanapi_system/x86_64
* ./install all-sbs verbose

How to create SBS docker image
==============================

1. Prepare SBS image: kanapi_system/test_system/prepare_sbs
2. Create docker image: kanapi_system/test_system/docker/make_sbs_image

