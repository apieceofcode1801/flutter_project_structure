import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:structure/app/locator.dart';

class FutureExampleViewModel extends FutureViewModel<String> {
  DialogService _dialogService = locator<DialogService>();
  Future<String> getDataFromServer() async {
    await Future.delayed(const Duration(seconds: 3));
    // return 'Fetched from server';
    throw Exception('Something went wrong');
  }

  @override
  Future<String> futureToRun() => getDataFromServer();

  @override
  void onError(error) {
    _dialogService.showDialog(
        title: 'Something went wrong bro', description: 'I\'m so sad');
  }
}
