# Poise-Archive Changelog

## v1.2.0

* Add back a tar-binary provider called `GnuTar`, used by default on Linux.
* Support for ZIP files via RubyZip.
* Full Windows support, including with the `user` and `group` properties.

## v1.1.2

* Fix compat with older Ruby that doesn't include `Entry#symlink?`.

## v1.1.1

* Fix GNU tar longlink extension.

## v1.1.0

* Scrap the original tar implementation in favor of a 100% pure-Ruby solution.
  This should work on all platforms exactly the same. Hopefully.

## v1.0.0

* Initial release!
