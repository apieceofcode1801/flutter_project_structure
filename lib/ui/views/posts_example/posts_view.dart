import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:structure/app/locator.dart';

import 'posts_viewmodel.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostsViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: model.isBusy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : !model.hasError
                ? ListView.builder(
                    key: PageStorageKey(
                      'posts-view-key',
                    ),
                    itemCount: model.data.length,
                    itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(35),
                          color: Colors.grey,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            model.data[index].title,
                            style: TextStyle(fontSize: 20),
                          ),
                        ))
                : Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Text(
                      model.error.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
      ),
      viewModelBuilder: () => locator<PostsViewModel>(),
    );
  }
}
