#!/bin/bash
# -*- coding: utf-8 -*-

if [ ! -d .env ] ; then
  virtualenv .env
fi
source .env/bin/activate
pip install -r requirements.txt -U $(id -u) -b .env/pip/build
python setup.py build_sphinx -b html
python setup.py build_sphinx -b epub
python setup.py build_sphinx -b latex
WORKING_DIR=$(pwd)
cd build/sphinx/latex
make
cd $WORKING_DIR
deactivate
