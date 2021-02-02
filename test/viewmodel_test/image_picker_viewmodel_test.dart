import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:structure/app/locator.dart';
import 'package:structure/services/media_service.dart';
import 'package:structure/ui/views/image_picker_example/image_picker_viewmodel.dart';

class MediaServiceMock extends Mock implements MediaService {}

void main() {
  group('ImagePickerViewModel Tests -', () {
    test(
        'When selectImage is called with fromGallery true, should request image with fromGallery true',
        () async {
      var mediaService = MediaServiceMock();
      locator.registerLazySingleton<MediaService>(() => mediaService);
      var model = ImagePickerViewModel();
      await model.selectImage(fromGallery: true);
      verify(mediaService.getImage(fromGallery: true));
    });
  });
}
