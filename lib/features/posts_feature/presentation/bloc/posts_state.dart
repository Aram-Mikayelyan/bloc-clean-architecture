import 'package:bloc_search/features/posts_feature/domain/entities/post_short.dart';

abstract class PostsState {}

class InitialState extends PostsState {}

class Loading extends PostsState {}

class LoadedPosts extends PostsState {
  final List<PostShortEntity> posts;
  LoadedPosts({required this.posts});
}

class PostsEmpty extends PostsState {}

class PostsLoadFailure extends PostsState {
  final String message;

  PostsLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}
