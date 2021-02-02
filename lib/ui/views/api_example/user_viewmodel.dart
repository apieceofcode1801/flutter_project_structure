import 'package:stacked/stacked.dart';
import 'package:structure/app/locator.dart';
import 'package:structure/datamodels/user.dart';
import 'package:structure/services/api.dart';

class UserViewModel extends FutureViewModel<User> {
  final _api = locator<Api>();
  final int userId;
  UserViewModel({this.userId});

  @override
  Future<User> futureToRun() => _api.getUserWithId(userId);
}
