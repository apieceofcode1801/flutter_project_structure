import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:structure/app/locator.dart';
import 'package:structure/app/router.gr.dart' as router;
import 'package:structure/ui/views/dialog_example/dialog_example_view.dart';
import 'package:structure/ui/views/future_example/future_example_view.dart';
import 'package:structure/ui/views/home/home_view.dart';
import 'package:structure/ui/views/partial_builds/partial_builds_view.dart';
import 'package:structure/ui/views/reactive_example/reactive_example_view.dart';
import 'package:structure/ui/views/stream_example/stream_example_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // onGenerateRoute: router.Router(),
      home: DialogExampleView(),
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
