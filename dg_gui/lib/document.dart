import 'package:flutter/cupertino.dart';
import 'package:url_router/url_router.dart';
import 'package:dg_prosemirror/dg_prosemirror.dart' as pm;

import 'package:pull_down_button/pull_down_button.dart';

// Create a tabset of a document view, this should probably be extracted

// I need a replacement for cupertinobutton with hover.

class TabSet extends StatelessWidget {
  final Widget child;
  TabSet(this.child);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            leading: Text("Document title"),
            trailing: Row(children: [
              CupertinoButton(
                child: Icon(CupertinoIcons.list_bullet_below_rectangle),
                onPressed: () {},
              )
            ])),
        child: child);
  }
}

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
