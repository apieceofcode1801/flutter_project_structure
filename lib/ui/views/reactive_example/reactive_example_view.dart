import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:structure/ui/smart_widgets/double_increase_counter/double_increase_counter_view.dart';
import 'package:structure/ui/smart_widgets/single_increase_counter/single_increase_counter_view.dart';
import 'package:structure/ui/views/reactive_example/reactive_example_view_model.dart';

class ReactiveExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReactiveExampleViewModel>.reactive(
        builder: (context, model, child) {
          print('ReactiveExampleView rebuilt');
          return Scaffold(
              body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleIncreaseCounterView(),
                  const SizedBox(
                    width: 50,
                  ),
                  DoubleIncreaseCounterView()
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                model.counter.toString(),
                style: TextStyle(fontSize: 40),
              )
            ],
          ));
        },
        viewModelBuilder: () => ReactiveExampleViewModel());
  }
}
