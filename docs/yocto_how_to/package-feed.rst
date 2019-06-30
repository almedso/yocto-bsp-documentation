=============
Package Feeds
=============


Controlled vars are:

.. code ::

  PACKAGE_FEED_URIS ?= "http://ams-package-feed"
  PACKAGE_FEED_BASE_PATHS ?= "ci release"
  PACKAGE_FEED_ARCHS = "all armv7ahf-neon armv7ahf"


It is recommended to:

* set *PACKAGE_FEED_URIS* in site.conf
* set *PACKAGE_FEED_ARCHS* in distro.conf
* compose PACKAGE_FEED_BASE_PATH* in distro.conf


results for opkg package into

a file */etc/opkg/base-feeds.conf*:

.. code ::

  src/gz uri-all-0 http://ams-package-feed/repo/ci/all
  src/gz uri-armv7ahf-neon-0 http://ams-package-feed/repo/ci/armv7ahf-neon
  src/gz uri-rigoletto-0 http://ams-package-feed/repo/ci/rigoletto
  src/gz uri-all-1 http://ams-package-feed/repo/release/all
  src/gz uri-armv7ahf-neon-1 http://ams-package-feed/repo/release/armv7ahf-neon
  src/gz uri-rigoletto-1 http://ams-package-feed/repo/release/rigoletto
