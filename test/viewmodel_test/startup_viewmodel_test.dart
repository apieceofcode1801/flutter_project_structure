import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:structure/app/router.gr.dart';
import 'package:structure/ui/views/startup/startup_view_model.dart';

import '../setup/test_helpers.dart';

void main() {
  setUp(() => registerServices());
  tearDown(() => removeServices());

  group('StartupViewmodelTest -', () {
    group('initialise -', () {
      test('When called, hasUser has been set', () async {
        var model = StartupViewModel();
        var sharedPreferences = registerAndGetSharedPreferencesServiceMock();
        await model.initialise();
        verify(sharedPreferences.hasUser);
      });

      test('When hasUser = true, navigate to home', () async {
        var model = StartupViewModel();
        var service = registerAndGetNavigationServiceMock();
        await model.initialise();
        verify(service.replaceWith(Routes.homeView));
      });
    });
  });
}
