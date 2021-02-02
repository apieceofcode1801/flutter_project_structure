import 'package:stacked/stacked.dart';
import 'package:structure/app/locator.dart';
import 'package:structure/services/counter_service.dart';

class ReactiveExampleViewModel extends ReactiveViewModel {
  CounterService _counterService = locator<CounterService>();
  int get counter => _counterService.counter;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_counterService];
}
