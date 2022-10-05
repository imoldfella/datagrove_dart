// this is to test a dialog box popping over flutter
import 'package:flutter/cupertino.dart';

Future<void> alert(BuildContext context, String s) async {
  return showCupertinoDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Alert'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(s),
            ],
          ),
        ),
        actions: <Widget>[
          CupertinoButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
