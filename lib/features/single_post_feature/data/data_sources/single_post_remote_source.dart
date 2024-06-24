import 'dart:convert';

import 'package:bloc_search/core/error/exception.dart';
import 'package:bloc_search/features/single_post_feature/data/models/post.dart';
import 'package:http/http.dart' as http;

abstract class SinglePostRemoteSource {
  Future<PostModel> getPost(int postId);
}

class SinglePostRemoteSourceImpl extends SinglePostRemoteSource {
  @override
  Future<PostModel> getPost(int postId) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId'));

    if (response.statusCode == 200) {
      return PostModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
