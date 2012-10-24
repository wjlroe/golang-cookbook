Description
===========

Installs golang either from a PPA or from Ubuntu's repositories
depending on the version of Ubuntu being used.

Recipes
=======

default
-------
Installs golang-stable from the PPA or golang

Attributes
==========

* `default[:golang][:release] = "stable"` -- The PPA package to
  install. Can be one of "stable", "weekly" or "tip". This has no
  effect on non-Ubuntu or Ubuntu greater than Precise.
