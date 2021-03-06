BSP Scope
=========

.. only:: html

   .. sectionauthor:: |vk_obfuscated|

.. only:: latex or man or texinfo or text

   .. sectionauthor:: |vk_plain_text|


The scope of this release includes custom meta-plos, meta-plos-bsp layer
as well as freescale, yocto and openembedded layers.


Priority of Dependent Layers
============================


.. blockdiag::
   :alt: Yocto BSP Layer Dependency
   :desctable:

   blockdiag {
     orientation = portrait;
     default_fontsize = 12;             // default value is 11
     default_shape = roundedbox;        // default value is 'box'
     default_group_color = "#FFF";
     default_node_color = "#FFF";
     default_linecolor = "#000";

     group {
       orientation = portrait;
       fontsize = 16;
       label = "PRI:6";

       meta-plos-bsp ->  meta-plos;
     }

     group {
       orientation = portrait;
       fontsize = 16;
       label = "PRI:5";

       meta-fsl-arm -> poky-meta, poky-meta-yocto;
     }

     group {
       orientation = landscape;
       fontsize = 16;
       label = "PRI:4";

       meta-fsl-arm-extra;
     }

     meta-ams-bsp -> meta-freescale-distro;
     meta-ams-bsp -> meta-raspberrypi;
     meta-ams -> poky-meta;

     meta-oe -> poky-meta;
     meta-fsl-arm -> meta-fsl-arm-extra;

     meta-ams-bsp      [numbered = "DI"];
     meta-ams-bsp      [description = "almedso BSP Metadata"];

     meta-ams          [numbered = "DI"];
     meta-ams          [description = "almedso Build Tool and Metadata"];

     meta-oe            [numbered = "DI"];
     meta-oe            [description = "OE/Yocto BSP layer for OpenEmbedded extra packages and features: `DOC <http://www.openembedded.org/>`__, `GIT <https://github.com/openembedded/meta-openembedded>`__"];

     poky-meta          [numbered = "DI"];
     poky-meta          [description = "Poky Build Tool and Metadata: `DOC <https://www.yoctoproject.org/documentation>`__, `GIT <http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta>`__"];

     poky-meta-yocto    [numbered = "DI"];
     poky-meta-yocto    [description = "Yocto Build Tool and Metadata: `DOC <https://www.yoctoproject.org/documentation>`__, `GIT <http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto>`__"];

   }

:M:     Master branch
:DI:    Dizzy branch
:DN:    Dizzy-next branch

