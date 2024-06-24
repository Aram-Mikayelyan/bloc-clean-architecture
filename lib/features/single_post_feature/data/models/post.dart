import 'package:bloc_search/features/single_post_feature/domain/entities/post.dart';

class PostModel {
  const PostModel({
    required this.id,
    required this.title,
    required this.body,
  });

  final int id;
  final String title;
  final String body;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
      };

  PostEntity toEntity() => PostEntity(
        id: id,
        title: title,
        body: body,
      );
}
