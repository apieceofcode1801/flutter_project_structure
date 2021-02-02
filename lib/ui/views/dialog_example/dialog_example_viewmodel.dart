import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:structure/app/locator.dart';

class DialogExampleViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  bool _confirmationResult;
  bool get confirmationResult => _confirmationResult;

  DialogResponse _dialogResponse;
  DialogResponse get customDialogResult => _dialogResponse;

  Future showBasicDialog() async {
    DialogResponse response = await _dialogService.showDialog(
        title: 'The Basic Dialog',
        description: 'Description',
        buttonTitle: 'Title',
        cancelTitle: 'Cancel',
        dialogPlatform: DialogPlatform.Material,
        barrierDismissible: true);

    print('DialogResponse: ${response.confirmed}');
  }

  Future showConfirmationDialog() async {
    var response = await _dialogService.showConfirmationDialog(
      title: 'Tile',
      description: 'Description',
      confirmationTitle: 'Yes',
      cancelTitle: 'No',
    );

    _confirmationResult = response.confirmed;
    notifyListeners();
  }

  Future showCustomDialog() async {}
}
