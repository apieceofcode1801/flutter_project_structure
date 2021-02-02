import 'package:auto_route/auto_route_annotations.dart';
import 'package:structure/ui/views/home/home_view.dart';
import 'package:structure/ui/views/startup/startup_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: HomeView),
  MaterialRoute(page: StartupView, initial: true)
])
class $Router {}
