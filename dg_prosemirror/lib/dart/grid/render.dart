import 'crdt.dart';
import '../foundation/foundation.dart';

class HtmlList {
  DartValueNotifier<Grid> grid;
  Grid previous = Grid();

  HtmlList({required this.grid}) {
    _update();
  }

  _update() {
    previous = grid.value;
  }

  int itemCount = 0;
  double runwayStart = 0;
  int itemStart = 0;
  List<DivElement> row = [];
  Function(double x)? onscroll;

  int anchor = 0;
  double anchorOffset = 0;

  // we only care about the items on our runway.
  // the anchor is the top visible item.
}
