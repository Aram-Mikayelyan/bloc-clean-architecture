import 'package:bloc_search/features/single_post_feature/domain/entities/post.dart';

abstract class PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final PostEntity post;
  PostLoaded({required this.post});
}

class PostLoadingFailure extends PostState {
  final String message;

  PostLoadingFailure(this.message);

  @override
  List<Object?> get props => [message];
}
