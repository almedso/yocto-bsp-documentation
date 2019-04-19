Machine in Yocto
================

Inspect the default includes for arm ...

.. code ::

   require conf/machine/include/tune-cortexa9.inc


   COMPATIBLE_MACHINE_<your_machine> = "<the other machine>"
   SOC_FAMILY = ...


Also set COMPATIBLE_MACHINE and SOC_FAMILY to have sufficient fallback patterns.


Switch of obsolete features

Redefining an existing machine
------------------------------

* use overwrites
* include the original machine conf
* add remove machine features
* apply alternateive definitions

.. code ::


    MACHINEOVERRIDES = "raspberrypi0-wifi:${MACHINE}"
    require conf/machine/raspberrypi0-wifi.conf

    MACHINE_FEATURES_remove = "keyboard screen touchscreen alsa bluetooth sdio"

    # Enable the console (as serial0 in kernel cmdline.txt) and in config.txt
    ENABLE_UART = "1"

    IMAGE_FSTYPES += "wic"
    SPLASH = ""



Qemu machines
-------------

* FPU_TARGET = hard | soft | 
* softfp --> requires "gnu/subs-soft.h" --> only comes with proper poky environment
  see https://stackoverflow.com/questions/49139125/fatal-error-gnu-stubs-soft-h-no-such-file-or-directory
* alternative with arm set DEFAULTTUNE = "armv7ahf-neon" - hf - indicates hard floating point arm7a is like
  armv7ve (+ virtualization) - DEFAULTTUNE tweaks the architecture 
  http://lists.openembedded.org/pipermail/openembedded-core/2013-August/083358.html 
* also set KMACHINE_qemuarm = "qemuarm9 for QEMU
* COMPATIBLE_MACHINE seems not to be required.

For qemu you must includes

.. code ::

   require conf/machine/include/qemu.inc



