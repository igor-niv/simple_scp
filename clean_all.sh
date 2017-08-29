#!/bin/bash

# pathes

THIS_DIR=`pwd`
THIRD_PARTY=$THIS_DIR/3rd_party

# openssl
cd $THIRD_PARTY/openssl
make clean
cd $THIS_DIR

# libssh
cd $THIRD_PARTY
rm -rf libssh.build
cd ./libssh
make clean
cd $THIS_DIR
