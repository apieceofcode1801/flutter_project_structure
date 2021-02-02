import 'package:injectable/injectable.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:structure/datamodels/comment.dart';
import 'package:structure/datamodels/post.dart';
import 'package:structure/datamodels/user.dart';

@lazySingleton
class Api {
  static const endpoint = 'http://jsonplaceholder.typicode.com';
  var client = http.Client();
  Future<List<Comment>> getCommentsForPost(int postId) async {
    List<Comment> comments = [];
    var response = await http.get('$endpoint/comments?postId=$postId');
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }
    return comments;
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>.empty(growable: true);
    var response = await http.get('$endpoint/posts?userId=$userId');
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var item in parsed) {
      final post = Post.fromJson(item);
      posts.add(post);
    }
    return posts;
  }

  Future<User> getUserWithId(int userId) async {
    var response = await http.get('$endpoint/users/$userId');
    return User.fromJson(json.decode(response.body));
  }
}
