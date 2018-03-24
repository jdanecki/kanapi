How to create new docker images automatically
=============================================

1. To create SBS docker image run in sbs directory: make_image
2. To create BBS docker imnage run in bbs directory: make_image
3. To create CLI docker imnage run in cli directory: make_image
4. To create X11 docker imnage run in x11 directory: make_image
5. To create GUI docker imnage run in gui directory: make_image
6. To create APPS docker imnage run in apps directory: make_image

How to use cli docker to build x11, gui, apps targets manually
==============================================================

1. kanapi_system/docker/update_cli_docker
2. kanapi_system/docker/run_cli_docker
3. In running container:
* /configure
* cd /kanapi_build/kanapi/kanapi_system/x86_64
* ./install x11 verbose
* ./install gui verbose
* ./install apps verbose

How to use BBS docker to build core-cli KaNaPi manually
=======================================================

1. kanapi_system/docker/update_bbs_docker
2. kanapi_system/docker/run_bbs_docker
3. In running container:
* /configure
* cd /kanapi_build/kanapi/kanapi_system/x86_64
* ./install t_core_cli verbose

How to use SBS docker to build BBS manually
===========================================

1. kanapi_system/docker/update_sbs_docker
2. kanapi_system/docker/run_sbs_docker
3. In running container:
* /configure
* cd /kanapi_build/kanapi/kanapi_system/x86_64
* ./install all-sbs verbose

How to create SBS docker image
==============================

1. Prepare SBS image: kanapi_system/test_system/prepare_sbs
2. Create docker image: kanapi_system/test_system/docker/make_sbs_image

