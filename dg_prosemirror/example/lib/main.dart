import 'package:flutter/cupertino.dart';
import 'package:dg_prosemirror/dg_prosemirror.dart' as pm;
import 'alert.dart';
//import 'package:pull_down_button/pull_down_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Prosemirror in Flutter Demo',
      theme: CupertinoThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  pm.ProsemirrorController controller = pm.ProsemirrorController(text: "");

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: const Text("Prosemirror"),
            trailing: CupertinoButton(
                padding: EdgeInsets.all(0),
                child: const Text("Alert"),
                onPressed: () async {
                  await alert(context, "yo!");
                })),
        child: SafeArea(
            child: pm.Prosemirror(
          controller: controller,
        )));
  }
}
