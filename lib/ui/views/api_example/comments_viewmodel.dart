import 'package:stacked/stacked.dart';
import 'package:structure/app/locator.dart';
import 'package:structure/datamodels/comment.dart';
import 'package:structure/services/api.dart';

class CommentsViewModel extends FutureViewModel<List<Comment>> {
  final int postId;
  CommentsViewModel({this.postId});

  @override
  Future<List<Comment>> futureToRun() =>
      locator<Api>().getCommentsForPost(postId);
}
