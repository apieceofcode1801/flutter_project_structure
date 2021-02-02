import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:structure/ui/views/stream_example/stream_example_view_model.dart';

class StreamExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StreamExampleViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: model.swapSources,
              ),
              body: Center(
                child: Text(model.title),
              ),
            ),
        viewModelBuilder: () => StreamExampleViewModel());
  }
}
