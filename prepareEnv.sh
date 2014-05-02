#! /bin/bash

if [ $# != 1 ];
	then echo "please specify the environment directory";
	exit 1;
fi
ENV_DIR=$1


for f in vim vimrc bashrc.perso git-completion.sh git-prompt.sh ; do
  if [ -h ${HOME}/.$f ] ; then
    unlink ${HOME}/.$f ;
  fi
  if [ -e ${HOME}/.$f ] ; then
    rm ${HOME}/.$f ;
  fi
  ln -s $ENV_DIR/$f ${HOME}/.$f ;
done
