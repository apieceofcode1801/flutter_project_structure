import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:structure/ui/views/startup/startup_view_model.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(child: Text(model.title)),
        floatingActionButton: FloatingActionButton(
          onPressed: model.navigateToHome,
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
