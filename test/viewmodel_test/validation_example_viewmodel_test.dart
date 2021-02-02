import 'package:flutter_test/flutter_test.dart';
import 'package:structure/ui/views/validation_example/validation_example_viewmodel.dart';

void main() {
  group('ValidationExampleViewmodelTest -', () {
    group('canSubmit -', () {
      test('When constructed canSubmit should be false', () {
        var model = ValidationExampleViewModel();
        expect(model.canSubmit, false);
      });

      test('When set all the valid values canSubmit should be true', () {
        var model = ValidationExampleViewModel();
        model.setName('Code Master');
        model.setEmail('apieceofcode1801@gmail.com');
        expect(model.canSubmit, true);
      });
    });
  });
}
