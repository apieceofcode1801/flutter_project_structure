import 'package:stacked/stacked.dart';
import 'package:structure/app/locator.dart';
import 'package:structure/datamodels/post.dart';
import 'package:structure/services/api.dart';

class PostsViewModel extends FutureViewModel<List<Post>> {
  final int userId;
  PostsViewModel({this.userId});

  @override
  Future<List<Post>> futureToRun() => locator<Api>().getPostsForUser(userId);
}
