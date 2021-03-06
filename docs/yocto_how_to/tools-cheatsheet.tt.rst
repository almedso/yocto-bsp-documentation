Yocto Tools Cheatsheet
======================


bitbake
-------

Environment variables

.. code ::

  bitbake -e <target> > applied-vars
  view applied-vars


bitbake tasks

.. code ::

  bitbake -c devshell <recipe>     # get command shell in recipe context
  bitbake -c devpython <recipe>    # get python interpreter in recipe context
  bitbake -c clean <recipe>        # remove output
  bitbake -c cleansstate <recipe>  # remove output, state cache
  bitbake -c cleanall <recipe>     # remove output, state cache and downloads
  bitbake -c fetchall <recipe>     # get all input to build
  bitbake -c cleanall <recipe>     # remove output, state cache and downloads

Inject Environment variables

.. code ::

  export EXT_VAR=foo
  export BB_ENV_EXTRAWHITE="$BB_ENV_EXTRAWHITE EXT_VAR"


oe-pkgdata-util
---------------

prerequisite: sourced environment

.. code ::

  # lookup which package is provided by which recipe
  oe-pkgdata-util lookup-recipe <package-name>

  # lookup which recipe is provides by which package
  oe-pkgdata-util lookup-pkg  <recipe-name>
  oe-pkgdata-util file-path  <file-spec-on-target>


bitbake-layers
--------------

Show layers and priorities

.. code ::

  bitbake-layers show-layers 

which layer a recipe is called and where are the appends

.. code ::
  bitbake-layers show-recipes <recipe-name>
  bitbake-layers show-appends <recipe-name>

