#!/bin/bash
#prepare the environment
conda create -n pelican-gwdata python=3.11 -y
conda activate pelican-gwdata
conda install -c conda-forge gwdatafind
conda install -c conda-forge pelicanplatform
conda install -c conda-forge htgettoken
#request access (it will open a web page to authenticate)
htgettoken -a vault.ligo.org -i igwn --scope "read:/staging" --audience "ANY"
#create the folder
mkdir -p o4b-0_data
#get the data
pelican object get -d -r osdf:///igwn/cit/staging/burst.benchmark/o4b-0/ o4b-0_data/
