import 'package:bloc_search/features/posts_feature/domain/entities/post_short.dart';

class PostShortModel {
  const PostShortModel({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  factory PostShortModel.fromJson(Map<String, dynamic> json) => PostShortModel(
        id: json['id'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };

  PostShortEntity toEntity() => PostShortEntity(
        id: id,
        title: title,
      );
}
