// ignore_for_file: public_member_api_docs, sort_constructors_first
// two lists and a map.

import 'package:dg_prosemirror/dart/foundation/foundation.dart';
import 'package:tuple/tuple.dart';

// cellId is logical, a row id + column id.
// after a grid update, it may no longer exist.

typedef DocRef = Tuple2<int,int>;

class CrdtList {
  // the list of ids grows forever
  int nextId = 0;
  List<int> id = [];

  int insert(int before){
    return nextId++;
  }
  // do need removeId though? taken care of with transform step?
  removeAt(int pos){

  }
  
}
class Grid {
  CrdtList row = CrdtList(), col=CrdtList();
  Map<BigInt, dynamic> cell = {};

  List<GridStep> unconfirmed = [];

  Tuple2<List<GridStep>,Grid> _rebase(List<GridStep> s){
    return Tuple2([],this);
  }

}

// the database needs to know which grids are being observed so it can update them.

class TupleList {

}
// 
abstract class DatabaseObserver<T> extends DartValueNotifier<T> {
  DatabaseObserver({required super.value});

  T updateFromServer(TupleList t);
}

class GridObserver<T> extends DatabaseObserver<Grid> {
  GridObserver({required super.value});
  
  @override
 updateFromServer(TupleList t) {
    // TODO: implement updateFromServer
    throw UnimplementedError();
  }
}

class DbNode {
  dynamic value; // every node computes a value
  DatabaseObserver? observer;
  List<DbNode> neededBy=[];
}
class Db  {
  Map<DocRef,DbNode > leaf = {};

  // because this is async, we collect all the changes then apply them at once
  updateFromServer(TupleList ) async {
    // split the tuple list by observer
    // what about the compute graph? if the observer is computable
    Map<DocRef, dynamic> toUpdate = {};


    // we can update all the database observers at once, no tears.
    for (var o  in toUpdate.entries){
      observer[o]!.value = o.value;
    }
  }
}

class Cell {}

// grid steps can be transformed in the prosemirror way.
// 
class GridStep {

}



// we could create a patchable array (cheaper than a tree? typing?)

// allow a dom builder on the web side build the dom from a vector
// events are filtered on the web side.
class ViewActor {

  int create(dynamic v){
    return 0;
  }
  update(int x, dynamic v){

  }
  remove(int x){

  }
  commit(){

  }
}
// potentially generate this automatically, like comlink?
// should we use protobufs? it's always transferrable then.

// fitWidth - layout so no horizontal scroll
// fixedWidth - each column has a known width
// fixedHeight - each row has a fixed height, and column widens to fit
// clip - rows have fixed height and columns have fixed width



// display a slice of a grid.
class GridSlice {
  late ViewActor actor;
  DartValueNotifier<Grid> grid;

  int begin=0, end=0;
  int renderBegin=0, renderEnd = 0;
  int anchor=0;

  // we can map grid row ids to view entitites.
  Map<BigInt, int> rendered;

  bool variableWidth = false;

  // the anchor should be the cursor instead of the top
  // when we 
  _cursor(CellId id) {

  }

  _gridUpdate() {
    // We need to find the anchor id, then get a range around that, then diff 
    final g = grid.value;
    int row = g.row.indexOf(anchor);
    renderBegin = row - 100;
    renderEnd = row + 200;
    for (var o=renderBegin; o<renderEnd; o++){
      // build new rows but reuse old cells. If we find a cell that we don't have, put it on the render list.

    }

    // where does the keyboard interaction sit? on the ui side and send us back by cell? 

    actor.commit();
  }
  // generally a change in the scroll.
  _uiUpdate() {

  }

  GridSlice({
    required this.grid,
    this.end=0,
    required this.renderEnd,
    this.anchor=0,
  });


  GridActor(ActorFactory f) {
    send = f.create('grid', _update);
  }
  render(,String id) {}
}
