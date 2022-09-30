#!/bin/bash

# check whether an input arguement is given
if [ $# -eq 0 ]; then
	echo "No input argument. Exit."
	exit 1
fi

if [ $# -gt 1 ]; then
	echo "Too many input arguments. Exit."
	exit 1
fi

RESEARCHROOT=$(pwd)
RESEARCHCODE=$1
HOMECODE=$HOME/code/$RESEARCHCODE
HOMEWRITING=$HOME/writing/$RESEARCHCODE

QUIT=0

if [[ -d "$HOMECODE" ]]; then
	echo "The code name $RESEARCHCODE exists in $HOME/code"
	QUIT=1
fi

if [[ -d "$HOMEWRITING" ]]; then
	echo "The code name $RESEARCHCODE exists in $HOME/writing"
	QUIT=1
fi

if [[ $QUIT -eq 1 ]]; then
	echo "Exit"
	exit 1
fi

# make code/res git repo
mkdir $HOMECODE
cd $HOMECODE
git init

# make writing/res git reop
mkdir $HOMEWRITING
cd $HOMEWRITING
git init

# make symlinks
GITDIR=$RESEARCHROOT/git
mkdir "$GITDIR"

cd "$GITDIR"
mkdir code
cd code
ln -s "$HOMECODE" .

cd "$GITDIR"
mkdir writing
cd writing
ln -s "$HOMEWRITING" .
