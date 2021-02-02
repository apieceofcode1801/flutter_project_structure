import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class CounterService with ReactiveServiceMixin {
  CounterService() {
    listenToReactiveValues([_counter]);
  }
  RxValue<int> _counter = RxValue<int>(initial: 0);
  int get counter => _counter.value;

  void incrementCounter() {
    _counter.value++;
  }

  void incrementDoubleCounter() {
    _counter.value += 2;
  }
}
