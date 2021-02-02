import 'package:stacked/stacked.dart';
import 'package:structure/app/locator.dart';
import 'package:structure/services/counter_service.dart';

class SingleIncreaseCounterViewModel extends BaseViewModel {
  final _counterService = locator<CounterService>();
  int _counter = 0;
  int get counter => _counter;

  void updateCounter() {
    _counterService.incrementCounter();
    notifyListeners();
  }
}
