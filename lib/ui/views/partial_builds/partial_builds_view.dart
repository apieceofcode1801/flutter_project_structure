import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:structure/ui/views/partial_builds/partial_builds_view_model.dart';

class PartialBuildsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        builder: (context, model, child) {
          print('PartialBuildView rebuilt');
          return Scaffold(
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_StringForm(), _TitleAndValueView()],
            ),
          );
        },
        viewModelBuilder: () => PartialBuildsViewModel());
  }
}

class _StringForm extends HookViewModelWidget<PartialBuildsViewModel> {
  _StringForm({Key key}) : super(key: key, reactive: false);
  @override
  Widget buildViewModelWidget(BuildContext context, viewModel) {
    print('_StringForm rebuilt');
    var text = useTextEditingController();
    return TextField(
      controller: text,
      onChanged: viewModel.updateString,
    );
  }
}

class _TitleAndValueView extends ViewModelWidget<PartialBuildsViewModel> {
  const _TitleAndValueView({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, viewModel) {
    print('_TitleAndValueView rebuilt');
    return Column(
      children: [
        Text(
          viewModel.title ?? '',
          style: TextStyle(fontSize: 24),
        )
      ],
    );
  }
}
