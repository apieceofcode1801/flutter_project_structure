import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:structure/ui/views/future_example/future_example_view_model.dart';

class FutureExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FutureExampleViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
              body: Center(
            child: model.isBusy
                ? CircularProgressIndicator()
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(model.hasError ? 'NO DATA' : model.data),
                      const SizedBox(
                        height: 16,
                      ),
                      _ErrorMessage()
                    ],
                  ),
          ));
        },
        viewModelBuilder: () => FutureExampleViewModel());
  }
}

class _ErrorMessage extends ViewModelWidget<FutureExampleViewModel> {
  @override
  Widget build(BuildContext context, model) {
    return model.hasError
        ? Container(
            child: Text(
              model.error().message,
              style: TextStyle(color: Colors.red),
            ),
            alignment: Alignment.center,
          )
        : Container();
  }
}
