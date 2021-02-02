import 'dart:async';

import 'package:stacked/stacked.dart';

class StreamExampleViewModel extends StreamViewModel {
  String get title => 'This is the time since epoch in year $data';

  bool _normal = true;

  @override
  Stream get stream => _normal ? epochUpdates() : epochUpdates(300);

  void swapSources() {
    _normal = !_normal;
    notifySourceChanged();
  }

  Stream<int> epochUpdates([int milliseconds = 1000]) async* {
    while (true) {
      await Future.delayed(Duration(milliseconds: milliseconds));
      yield DateTime.now().millisecondsSinceEpoch;
    }
  }

  Stream<int> epochUpdatesSlower() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield DateTime.now().millisecondsSinceEpoch;
    }
  }

  @override
  transformData(data) {
    super.transformData(data);
    return data * 1000;
  }

  @override
  void onData(data) {
    // print(data.toString());
  }
}
