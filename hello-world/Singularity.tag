Bootstrap: shub
From: bsmind/hello-world:latest


%labels
    MAINTAINER Sungsoo Ha (sungsooha@bnl.gov)


%setup
    # setup is run after the base 'ubuntu:16.04' image is
    # downloaded and unpacked but before entering the container
    # environment.
    # The current path on the local system will become your 
    # container's root directory
    echo ${SINGULARITY_ROOTFS}


%post
    # post is run after entering the container env.
    # need to install some development tools to build your code
    apt-get update && apt-get -y install vim

    mkdir -p /code
    echo "echo RooooooAAAAAAAAR" >> /code/rawr_long.sh
    chmod u+x /code/rawr_long.sh

%environment
    # define environment variables here
    # These vars will be set during calls to 'shell', 'exec',
    # or 'run' but will not be set during the previous 'post'
    # section of the recipe file.
    # So, if you need then, define them there as well!
    export RAWR_BASE=/code


%runscript
    # run script
    exec /bin/bash /code/rawr_long.sh "$@"

