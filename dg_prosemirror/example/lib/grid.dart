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
  pm.ListController listController = pm.ListController(
    itemCount: 10,
    load: (int index) async => pm.HtmlContent(text: "<p>Item $index</p>"),
  );
  pm.ProsemirrorController inputController =
      pm.ProsemirrorController(text: "hello, world");
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
            child: Column(
          children: [
            Expanded(child: pm.EditorListView(controller: listController)),
            SizedBox(
                height: 64,
                child: Container(
                    color: CupertinoColors.darkBackgroundGray,
                    child: Row(children: [
                      CupertinoButton(
                          onPressed: () {}, child: Icon(CupertinoIcons.add)),
                      Expanded(
                          child:
                              pm.ProsemirrorField(controller: inputController)),
                      CupertinoButton(
                          onPressed: () {},
                          child: Icon(CupertinoIcons.arrow_up_circle_fill))
                    ])))
          ],
        )));
  }
}
