import 'package:flutter/cupertino.dart';
import 'package:url_router/url_router.dart';
import 'package:dg_prosemirror/dg_prosemirror.dart' as pm;

class DocumentView extends StatefulWidget {
  @override
  State<DocumentView> createState() => _DocumentViewState();
}

class _DocumentViewState extends State<DocumentView> {
  pm.ProsemirrorController controller = pm.ProsemirrorController(text: "");

  @override
  Widget build(BuildContext context) {
    return pm.Prosemirror(
      controller: controller,
    );
  }
}
