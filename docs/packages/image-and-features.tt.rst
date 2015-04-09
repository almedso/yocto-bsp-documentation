.. include:: ../glosterm.rst


Yocto Distribution, Image and Feature Management
================================================

Yocto maintains machine, distribution and image management.

A distribution is kind of superset of features that are deployable
to various machines by one or multiple images.

Features can be used to describe an image, machine or distribution.
They can grouped into FEATURE_PACKAGES, that are
mapped to package groups. Package groups provide the container where packages
fall in.


Distribution Features
=====================

There are some features that are part of all images if

* the machine supports that features
* the features are not explicitly excluded by the image definition

Those features are declared in the distribution and are available via
the package feed.

.. tabularcolumns:: |p{0.3\textwidth}|p{0.65\textwidth}|

.. _PLOS_DISTROFEATURES:

.. list-table:: Distribution Features used by |PLOS|
   :widths: 3 7
   :header-rows: 1

   * - Feature
     - Meaning
   * - ext2
     - Support tools for devices with internal HD/micro drives, sd cards.
   * - largefile
     - Support for large files (required by libsndfile, etc).
   * - opengl
     - Provide OpenGL implementation.
   * - systemd
     - Init manager instead of System V Init process.
   * - usbgadget
     - Support of USB gadget device (for USB networking, serial, storage).
   * - wifi
     - Support of WiFi networks.
   * - xattr
     - Support extended file attributes.
   * - wayland
     - Support wayland for graphical displays.

System V startup is explicitly excluded.


Image Features
==============

Business relevant Image Features
--------------------------------

There are business relevant image features are predefined by the distribution.
I.e. The default image is the business/production image.


Arbitrary Image Features
------------------------

Along those business features there are cross-functional image features, that
either extend functionality or provide additional arbitrary behavior. Those
features are mainly for development and maintenance purposes and are not
subject to production grade systems.

The following image features are predefined by Yocto and are adapted for
every custom layer.

.. tabularcolumns:: |p{0.3\textwidth}|p{0.65\textwidth}|

.. _PLOS_IMAGEFEATURES_ARB:

.. list-table:: Arbitrary Image Features
   :widths: 3 7
   :header-rows: 1

   * - Feature
     - Meaning
   * - <base-feature>-sdk
     - Additional features that for a development SDK on host platform
       and target platform.
   * - <base-feature>-tools-debug
     - Are all debugging tools + debugging libraries etc. potentially
       also all packages are those with debugging informations.
   * - <base-feature>-tools-profile
     - All profiling tools to allow analysis of the timing behavior.
   * - <base-feature>-tools-testapps
     - Are all packages that allow testing on target like test fixtures,
       test execution applications, etc.

There are more image features defined by Yocto that do not require
customization.


Images
======

The name of the recipe to build an image is the same as the image.

:plos-image-base:

   The base image of the distribution, where all dependend images
   are intended to start from

   - base-plos (via plos-image bbclass)



:plos-image:

   A product image capable of allowing an |PLOS|
   device to boot and provides full feature support.
   Contained features are:

   - base-plos (via plos-image bbclass)

   - ssh-server-openssh
   - package-management



:plos-image-dev:

   A developer image just capable of allowing an |PLOS|
   device to boot and is suitable for cross development work.
   Contained features are:

   - base-plos (via plos-image bbclass)
   - debug-tweaks
   - dev-pkgs
   - eclipse-debug
   - tools-cross
   - tools-debug
   - tools-profile
   - tools-sdk
   - tools-testapps

   - package-management
   - ssh-server-openssh



:plos-image-minimal:
   A developer image just capable of allowing an
   |PLOS| device to boot and is suitable for full featured development work.
   Contained features are:

   - base-plos (via plos-image bbclass)

:plos-image-minimal-dev:
   A small image just capable of allowing an |PLOS|
   device to boot and is suitable for development work. (kernel, rootfs and
   uboot developtment)
   Contained features are:

   - base-plos (via plos-image bbclass)
   - dev-pkgs


Package Groups
==============

Package groups describe what packages are deployed together. Features are
mapped via feature packages to package groups.

There is a set of canonical package groups that are used to for distro features
and allow simplification of image composition.

.. tabularcolumns:: |p{0.3\textwidth}|p{0.65\textwidth}|

.. _PLOS_CANONICAL_PKGGRPS:

.. list-table:: Canonical Package Groups
   :widths: 3 7
   :header-rows: 1

   * - Package Group
     - Layer
   * - base-plos
     - meta-plos
   * - plos-sdk
     - meta-plos
   * - plos-tools-testapps
     - meta-plos
   * - plos-tools-cross
     - meta-plos
   * - plos-tools-debug
     - meta-plos
   * - plos-tools-profile
     - meta-plos

Packages sorted into Package Groups
-----------------------------------

.. tabularcolumns:: |p{0.3\textwidth}|p{0.65\textwidth}|

.. _PLOS_GRPPKGS:

.. list-table:: Grouped Packages (in project plos)
   :widths: 3 7
   :header-rows: 1

   * - Package Group
     - Packages

   * - base-plos
     - dconf,
       formfactor,
       apache2,
       webmin,
       timestamp-service


   * - plos-tools-cross
     - openssh-sftp-server,
       python-virtualenv,
       vim

   * - plos-tools-testapps
     - (evtest),
       i2c-tools

   * - plos-sdk
     - bash,
       git,
       python-dbg,
       python-setuptools,
       wget


References
==========

* :yokto172dev:`usingpoky-extend-customimage`
* :yokto172dev:`usingpoky-extend-customimage-imagefeatures`
* :yokto172dev:`usingpoky-extend-customimage-custombb`
* :yokto172dev:`usingpoky-extend-customimage-customtasks`

* :yokto172ref:`ref-images`
* :yokto172ref:`ref-features-machine`
* :yokto172ref:`ref-features-distro`
* :yokto172ref:`ref-features-image`

* :yokto172ref:`var-FEATURE_PACKAGES`
* :yokto172ref:`var-IMAGE_FEATURES`
* :yokto172ref:`var-IMAGE_INSTALL`
* :yokto172ref:`var-PACKAGES`
