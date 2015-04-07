#!/usr/bin/env python
# -*- coding: utf-8 -*-


try:
    from setuptools import setup, find_packages
except ImportError:
    from distutils.core import setup


try:
    version = open('version').read()
except IOError:
    version = "0.1.a1"


readme = open('README.rst').read()

requires = open('requirements.txt').read()


setup(
    name='pxm-bsp-documentation',
    version=version,
    author='Volker Kempert',
    author_email='volker.kempert@pixmeter.com',
    description='Pixmeter BSP Documentation',
    long_description=readme,
    zip_safe=False,
    classifiers=[
        'Development Status :: 1 - alpha',
        'Environment :: Console',
        'Intended Audience :: Developers',
        'License :: Alere',
        'Operating System :: OS Independent',
        'Programming Language :: Shpinx ReST',
        'Topic :: Documentation',
        'Topic :: Utilities',
    ],
    platforms='any',
    packages=find_packages(),
    include_package_data=True,
    install_requires=requires,
)