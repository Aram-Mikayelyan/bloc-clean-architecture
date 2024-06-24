import 'dart:convert';

import 'package:bloc_search/core/error/exception.dart';
import 'package:bloc_search/features/posts_feature/data/models/post_short.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteSource {
  Future<List<PostShortModel>> getPosts();
}

class PostRemoteSourceImpl extends PostRemoteSource {
  @override
  Future<List<PostShortModel>> getPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final list = json.decode(response.body) as List;
      return list.map((post) => PostShortModel.fromJson(post)).toList();
    } else {
      throw ServerException();
    }
  }
}
