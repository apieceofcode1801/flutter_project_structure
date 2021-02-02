import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:structure/app/locator.dart';
import 'package:structure/app/router.gr.dart';
import 'package:structure/services/shared_preferences_service.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  String _title = 'Startup View';
  String get title => '$_title $_counter';

  int _counter = 0;
  int get counter => _counter;

  void updateCounter() {
    _counter++;
    notifyListeners();
  }

  Future navigateToHome() async {
    await _navigationService.replaceWith(Routes.homeView);
  }

  Future initialise() async {
    var hasUser = _sharedPreferencesService.hasUser;

    if (hasUser) {
      await _navigationService.replaceWith(Routes.homeView);
    }
  }
}
