import 'package:stacked/stacked.dart';
import 'package:structure/app/locator.dart';
import 'package:structure/services/counter_service.dart';

class SingleIncreaseCounterViewModel extends ReactiveViewModel {
  final _counterService = locator<CounterService>();
  int get counter => _counterService.counter;

  void updateCounter() {
    _counterService.incrementCounter();
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_counterService];
}
