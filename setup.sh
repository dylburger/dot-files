#!/bin/bash

# Make the right symlinks
REPO=`pwd`
cd ${HOME}
ln -s ${REPO}/.bashrc 
ln -s ${REPO}/.bashrc_br 
ln -s ${REPO}/.bashrc_mac 
ln -s ${REPO}/.bashrc_linux 
ln -s ${REPO}/.bash_profile 
ln -s ${REPO}/.profile 
ln -s ${REPO}/.vimrc 
ln -s ${REPO}/.vim 
