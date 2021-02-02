import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:structure/ui/views/home/home_view_model.dart';
import 'package:structure/ui/views/posts_example/posts_view.dart';
import 'package:structure/ui/views/todo/todo_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[800],
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                label: 'Posts', icon: Icon(Icons.art_track)),
            BottomNavigationBarItem(label: 'Todos', icon: Icon(Icons.list))
          ],
        ),
        body: _getViewForIndex(model.currentIndex),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget _getViewForIndex(int index) {
    switch (index) {
      case 0:
        return PostsView();
      case 1:
        return TodoView();
      default:
        return PostsView();
    }
  }
}
