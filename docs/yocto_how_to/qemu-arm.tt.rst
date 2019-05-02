==============
Yocto and Qemu
==============

More specifically this is focussing on ARM Cortex-? architecture
based qemu machines.


Usage on Yocto
--------------

1. Define Machine qemu base machine

   * There are different machine images definitions available
     e.g. vexpress-a9 for cortex-a9 command set (armv7a),
     The qemu arch should match the arch of your target machine
   * Make sure to pick the right kernel / kernel-branch and version
   * Set compatible machine

 
2. Build the machine an image for the machine

   .. code ::

      MACHINE=my-qemu-machine bitbake my-image

3. Run the image:

   .. code ::

      runqemu my-qemu-machine


   *runqemu* encapsulates the native call to the qemuarm emulator
   and passes on arguments collected from the build (like kernel, rootfs)
   and paramters like networks, memory etc as defined by *QB_xyz*

   .. note ::

      graphics does not always run.
      use the nographic option. e.g.

      .. code ::

         runqemu qemuarm nographic

      This option is passed on directly to *qemuarm*


References
----------

* Qemu home page: https://www.qemu.org
* Meta layer for cortex-a9: https://github.com/OverC/meta-qemuarma9 
* Build qemu kernel from scratch: https://medicineyeh.wordpress.com/2016/03/29/buildup-your-arm-image-for-qemu





