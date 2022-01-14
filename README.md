# swift-docc-docker

Small layer on top of `swift` docker image to add in tools necessary for automated releases of swift packages to github and cocoapods trunk

- `swift-docc-render` built and set in environment for `DOCC_HTML_DIR`
- `ruby` installed via `rvm`
- `pod` installed via `gem` globally
- [auto](https://github.com/intuit/auto/) installed in `~/` and linked to `PATH`

`swift-docc-render` is included in Xcode, but for building docs with [docc](https://github.com/apple/swift-docc) without Xcode, such as for just a swift package, this needs to be built and set manually.