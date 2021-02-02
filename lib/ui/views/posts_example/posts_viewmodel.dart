import 'package:injectable/injectable.dart';
import 'package:structure/app/locator.dart';
import 'package:structure/datamodels/post.dart';
import 'package:structure/services/posts_service.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class PostsViewModel extends FutureViewModel<List<Post>> {
  final _postsService = locator<PostsService>();

  @override
  Future<List<Post>> futureToRun() {
    print('Fetch posts');
    return _postsService.getPostsForUser(3);
  }
}
