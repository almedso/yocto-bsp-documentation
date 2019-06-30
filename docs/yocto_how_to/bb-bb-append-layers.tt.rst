====================================
Bitbake bb, bbappend layers and prio
====================================

bbappend files are applied in order of increasing layer priority.

Example of how to structure:
.. code ::

  /meta-bsp/recipes-core/images/image.bb
      ... base packages

  /meta-bsp/recipes-core/images/image-dev.bb
      ... development packages (like vim/htop/tree...)



  /meta-application/recipes-core/images/image.inc
      ... application packages

  /meta-application/recipes-core/images/image.bbappend
      require image.inc

  /meta-application/recipes-core/images/image-dev.bbappend
      require image.inc
      ... application testing programms



  /meta-my-security/recipes-core/images/image.inc
      security packages

  /meta-my-security/recipes-core/images/image.bbappend
      require image.inc

  /meta-my-security/recipes-core/images/image-dev.bbappend
      require image.inc
      .. security testing packages

BBFILE_PRIORITY
  The precedence established through this variable stands regardless of a recipe's version (PV variable).


Layers commands
---------------

.. code ::

   bitbake-layers show-layers

References
----------

* https://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-BBFILE_PRIORITY
* https://unix.stackexchange.com/questions/311549/choosing-the-order-of-2-appended-recipes-in-yocto
* https://community.nxp.com/docs/DOC-331917
* https://www.openembedded.org/Layers_FAQ