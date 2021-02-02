import 'package:injectable/injectable.dart';

@lazySingleton
class SharedPreferencesService {
  bool _hasUser;
  bool get hasUser => _hasUser;
  setHasUser(bool hasUser) {
    _hasUser = hasUser;
  }
}
