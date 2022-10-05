This library coordinates with prosemirror/codemirror editors and grids in a web view or div for flutter web.

This library is a little overloaded with functionality because we don't want to ship multiple copies of javascript libraries and it gets a little odd coordinating that with flutter.

The edit library watch and build commands rebuild the javascript code for this library as an asset.

Will not work on MacOS until there is a webview (active issue on github)

