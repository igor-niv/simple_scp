#!/bin/bash

#colors

RED=`tput setaf 1`
CYAN=`tput setaf 14`
RESET=`tput sgr0`

# multithread build

NCORES=8

# pathes

THIS_DIR=`pwd`
THIRD_PARTY=$THIS_DIR/3rd_party
OPENSSL_DIR=$THIRD_PARTY/openssl


function print_header {

    echo 
	echo ${CYAN}--------------------------------------
	echo Building ${1}...
	echo --------------------------------------${RESET}
}

function build_openssl {
	./Configure ${1}
	make clean && make -j${NCORES}
}

function build_libssh {
	cd ..
	if [ -d $THIS_DIR/3rd_party/libssh.build ]; then
		rm -rf $THIS_DIR/3rd_party/libssh.build
	fi
	mkdir libssh.build
	cd libssh.build
	cmake ./../libssh -DOPENSSL_ROOT_DIR=${OPENSSL_DIR} -DOPENSSL_LIBRARIES=${OPENSSL_DIR}/lib
	make clean && make -j${NCORES}
}

# build 3rd_party

cd $OPENSSL_DIR
print_header OpenSSL
build_openssl darwin64-x86_64-cc
cd $THIS_DIR

cd $THIRD_PARTY/libssh
print_header libSSH
build_libssh
cd $THIS_DIR
