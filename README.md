# swift-docc-docker

Small layer on top of `swift` docker image that installs node and builds [swift-docc-render](https://github.com/apple/swift-docc-render) and sets `DOCC_HTML_DIR` environment variable.

`swift-docc-render` is included in Xcode, but for building docs with [docc](https://github.com/apple/swift-docc) without Xcode, such as for just a swift package, this needs to be built and set manually.