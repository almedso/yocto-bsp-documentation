=========================
almedso BSP Documentation
=========================

Introduction
============

This this documentation covers the specifics of almedso's BSP's for
COTS boards adapted to the *plos* distribution maintained by pixmeter.

Installation
============

This documentation is pythonically organized and facilitates the ref: Sphinx
build system.

Create a virtual environment and activate it:

.. code:: (bash)

   $ virtualenv venv
   $ source venv/bin/activate

Install the required software:

.. code:: (bash)

   $(venv) pip install -r --pre requirements.txt

Build the documentation. (Check for broken links):

.. code:: (bash)

   $(venv) python setup.py build_sphinx -b html  # e.g. for html/web
   
Alternatively use the *build.sh* script for building the documentation.

Browse the documentation (e.g. html):

.. code:: (bash)

   $(venv) firefox build/sphinx/html/index.html
   

Alternatively you can build by just calling *build.sh* script.


Todos and Issues
================

* TODO

Documentation References
========================

.. _Sphinx: http://sphinx.pocoo.org/
.. _reStructuredText: http://docutils.sourceforge.net/rst.html

