// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:html';
import 'dart:typed_data';

import 'package:dg_prosemirror/dart/foundation/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:js/js.dart';

import '../dart/grid/crdt.dart';

typedef GridViewController = DartValueNotifier<Grid>;

// maybe a message is always a protobuf with optional uint8lists for big byte arrays. we still need something to type the protobuf stream.
// stabl
typedef Message = List<Uint8List>;

abstract class ActorFactory {
  // each actor can define their own protobufs that they will listen to.
  Function(Message) create(String actor, Function(Message)? replyTo);
}

// proxy for flutter to connect with web counterpart.
//
class GridView extends StatefulWidget {
  @override
  State<GridView> createState() => _GridViewState();

  GridViewController? controller;

  GridView({super.key, this.controller});
}

// we need a socket like thing to communicate remotely with the web canvas
// operating in
class _GridViewState extends State<GridView> {
  final grid = GridActor();

  @override
  void initState() {
    super.initState();
  }

  _update() {
    // when control changes we need to
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/*
class GridView extends StatefulWidget {
  GridViewController? controller;

  GridView({super.key, this.controller});
  
  @override
  State<GridView> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _GridViewState extends State<GridView> {
  late EditorDiv div;
  late GridViewController controller;

  @override
  void initState() {
    controller = widget.controller ?? GridViewController();
    div = EditorDiv(text: controller.text);
    super.initState();
    //alertMessage(div.id);
    print(
        "${div.id}, ${div.div.children[0].getAttribute('id')}, ${div.div.outerHtml},${html.document.getElementById(div.id)}");

    GridView(div.div);
  }

  @override
  void dispose() {
    div.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return div.widget;
  }
}

@JS('window.GridView')
external void GridView(dynamic s);
*/
