import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:structure/app/locator.dart';
import 'package:structure/services/shared_preferences_service.dart';

class SharedPreferencesServiceMock extends Mock
    implements SharedPreferencesService {}

class NavigationServiceMock extends Mock implements NavigationService {}

SharedPreferencesServiceMock registerAndGetSharedPreferencesServiceMock(
    {bool hasUser = true}) {
  _removeRegistrationIfExists<SharedPreferencesService>();
  var sharedPreferences = SharedPreferencesServiceMock();

  when(sharedPreferences.hasUser).thenReturn(hasUser);

  locator.registerSingleton<SharedPreferencesService>(sharedPreferences);
  return sharedPreferences;
}

NavigationServiceMock registerAndGetNavigationServiceMock() {
  _removeRegistrationIfExists<NavigationService>();
  var navigationService = NavigationServiceMock();
  locator.registerSingleton<NavigationService>(navigationService);
  return navigationService;
}

registerServices() {
  registerAndGetNavigationServiceMock();
  registerAndGetSharedPreferencesServiceMock();
}

removeServices() {
  locator.unregister<SharedPreferencesService>();
  locator.unregister<NavigationService>();
}

_removeRegistrationIfExists<T>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
