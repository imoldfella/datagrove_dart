class DartValueNotifier<T> {
  // we could give the entire tree and let the app diff?
  late T value_;
  DartValueNotifier({required T value}) {
    value_ = value;
  }

  notifyListeners() {}
  set value(T view) {
    notifyListeners();
  }

  T get value => value_;

  void addListener(Function() notify) {}
}
