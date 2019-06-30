
==============
Image Creation
==============


**wic** tool is the generaal solution with support of **bmaptool** for transfer to sd card

* wic tool as well as bmaptool can be created via bitbake wic bmaptool.

.. code ::

   bitbake bmaptool wic


* bmaptool can be installed directly
.. code ::

   apt install bmap-tools

Configure
---------

Ideally at the machine configuration (or in local.conf or distribution configuration) set:

.. code ::

   # make images of this machine part of wic
   IMAGE_FSTYPES += "wic"
   WKS_FILE ?= "sdimage-bootpart.wks"

This will not work if it is placed in any "image recipes"

Build
-----

Bild the required native tools upfront such that the wic image can be created

.. code ::

   bitbake parted-native dosfstools-native mtools-native


after that any image (with FS_TYEPE containing wic) will pass

.. code ::

   bitbake core-image-min

The image resulting wic file will is found in the image deploy folder
It is named of machine and base image name.
(e.g. $TMPDIR/deploy/images/$MACHINE/$MACHINE-$BASE_IMAGE_NAME.wic)

Flash the image on disk by

.. code ::

   sudo bmaptool copy --nobmap <image> <block device name>


Remarks and History
-------------------

WIC harmonized the image creation across platforms, vendors etc

Before that (yocto version < 2) it was like write your own scripts using mparted, spart, dd, mkfs, ...

wic.gz images can also be directly written to sd card via dd
e.g.
.. code ::

   gunzip -c 'core-image-min-board.wic.gz' | sudo dd of=/dev/sdX bs=1M  iflag=fullblock oflag=direct conv=fsync status=progress



References
----------

* https://www.yoctoproject.org/docs/2.3/dev-manual/dev-manual.html#building-images
* https://www.yoctoproject.org/docs/2.3/dev-manual/dev-manual.html#creating-partitioned-images
* https://github.com/FrankBau/meta-marsboard-bsp/wiki/Prepare-SD-card