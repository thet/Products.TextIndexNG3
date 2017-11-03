#!/bin/bash

export PATH=\
/opt/buildout.python/bin:\
$PATH:

if [[ "$1" = "plone-4.3" ]]
then
    python_version=2.7
    config=alltests-plone43.cfg
fi

if [[ "$1" = "plone-5.0" ]]
then
    python_version=2.7
    config=alltests-plone50.cfg
fi

if [[ "$1" = "plone-5.1" ]]
then
    python_version=2.7
    config=alltests-plone51.cfg
fi

virtualenv --clear .
bin/pip install zc.buildout
bin/buildout bootstrap
bin/buildout -c $config
bin/test
