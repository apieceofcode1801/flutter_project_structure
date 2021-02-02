import 'package:stacked/stacked.dart';
import 'package:structure/app/locator.dart';
import 'package:structure/services/counter_service.dart';

class DoubleIncreaseCounterViewModel extends ReactiveViewModel {
  final _counterService = locator<CounterService>();
  int get counter => _counterService.counter;

  void updateCounter() {
    _counterService.incrementDoubleCounter();
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_counterService];
}
