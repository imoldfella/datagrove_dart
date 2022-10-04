library dg_filebrowse;

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:file/file.dart';
import 'package:cross_file/cross_file.dart';
import 'package:fluent_ui/fluent_ui.dart';


class FileBrowser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: (detail) async {
         final List<XFile> _list = [];
        
          _list.addAll(detail.files);
        

        debugPrint('onDragDone:');
        for (final file in detail.files) {
          debugPrint('  ${file.path} ${file.name}'
              '  ${await file.lastModified()}'
              '  ${await file.length()}'
              '  ${file.mimeType}');
        }
      },
        child: CupertinoPageScaffold(navigationBar:  CupertinoNavigationBar(),
        child:  ));
  }
}
