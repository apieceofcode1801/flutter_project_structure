import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:structure/app/locator.dart';
import 'package:structure/services/media_service.dart';

class ImagePickerViewModel extends BaseViewModel {
  final _mediaService = locator<MediaService>();
  File _selectedImage;

  bool get hasSelectedImage => _selectedImage != null;

  File get selectedIamge => _selectedImage;

  Future selectImage({@required bool fromGallery}) async {
    _selectedImage =
        await runBusyFuture(_mediaService.getImage(fromGallery: fromGallery));
  }
}
