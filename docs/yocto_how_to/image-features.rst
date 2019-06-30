==============
Image Features
==============

Image features can be used to implement different variants of an image.

* Default: Image features can be any *packagegroups* or one of the predefines.
* predefined are "debug-tweaks read-only-rootfs empty-root-password allow-empty-password post-install-logging*
*

Configure
---------

Add a new feature

in an image file
.. code ::

   # Make sure the introduced "staticipaddress" feature is accepted
   IMAGE_FEATURES[validitems] += "staticipaddress"

   EXTRA_IMAGE_FEATURES += "staticipaddress"


now you can react on the new feature in any recipe. e.g.

.. code ::
   FILESEXTRAPATHS_prepend := "${@bb.utils.contains('IMAGE_FEATURES', 'staticipaddress', '${THISDIR}/${PN}', '', d)}"

Build
-----

just build the image

Remarks and history
-------------------

References
----------

* https://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-IMAGE_FEATURES
* https://www.yoctoproject.org/docs/2.5/dev-manual/dev-manual.html#usingpoky-extend-customimage-imagefeatures
* http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/image.bbclass?h=fido
