// is the grid layout a different source than the underlying data?
// how does that work?

// use version numbers instead the more typical object identity
// object identity won't work across isolates/workers.

import 'dart:html';
import '../foundation/foundation.dart';

// could be column with vertical scripts.
class RowList<T> {
  List<int> key;
  List<T> value;
  RowList(this.key, this.value);
}

class Materialized<T> {
  int length = 0;
  RowList<T> slice(int start, int end) {
    return RowList([], []);
  }
}

typedef DataSource = DartValueNotifier<Materialized<Row>>;
typedef Row = List<Cell>;

class HtmlList {
  DataSource source;
  Materialized previous = Materialized();

  HtmlList({required this.source});

  int itemCount = 0;
  double runwayStart = 0;
  int itemStart = 0;
  List<DivElement> row = [];
  Function(double x)? onscroll;

  int anchor = 0;
  double anchorOffset = 0;

  // we only care about the items on our runway.
  // the anchor is the top visible item.

  diff() {
    previous = source.value;
  }
}

class RowFormat {
  int version = 0;
  double? size;
}

class Cell {
  int version = 0;
}

class Snapshot {
  List<Column> column = [];
  List<Row> row = [];
  Map<int, Cell> byVersion = {};
}

class Delta {
  List<CellDelta> delta = [];
}

// when we publish is it always static?
// dartjs? Can dartjs and react work well together?
// react is just functions?

// when using webview it will make more sense to dart2js and have this on the web side.

// moving doesn't cause any reformating
class MoveCell {
  int entity = 0;
  double top = 0, left = 0;
}

// null is no change to html, only change to outer div.
class ReplaceCell {
  int index = 0;
  String html = "";
}

class ColumnDelta {
  int index = 0;
  double width = 0;
}

class GridDelta {
  List<MoveCell> move = [];
  List<ReplaceCell> replace = [];
}

// we probably want to get some measurements back? we can't try to measure everything in big grids, but for small grids estimates should be tight?

// we only want to measure once. to do this we need the cells to be wrapped in a column div, so that they come one after the other. each one can be like Surma's infinite scroller. otoh, it's probably fine to just batch all the measurements.

// allow the list to widen to accomodate the widest known element.
// needs to report back changes in width.

// insert, delete, update.
// ho
class ListDelta {}

class ListController {
  commit(ListTx) {}
}

class VariableWidthDelta {
  double? zoom;
  List<String> html = [];
  double runwayStart = 0;
}

class VariableWidthList {
  apply(VariableWidthDelta delta) {}
}

//
class FixedWidthList {
  // mini-ecs?
  List<DivElement> div = [];

  // whenever we change a column

  apply(GridDelta delta) {
    for (var o in delta) {
      div[o.index].innerHtml = o.html;
    }
  }
}
