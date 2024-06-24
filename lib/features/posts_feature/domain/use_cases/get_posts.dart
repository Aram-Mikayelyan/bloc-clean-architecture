import 'package:bloc_search/core/error/failure.dart';
import 'package:bloc_search/features/posts_feature/domain/entities/post_short.dart';
import 'package:bloc_search/features/posts_feature/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class GetPostsUseCase {
  final PostRepository postRepository;

  GetPostsUseCase(this.postRepository);

  Future<Either<Failure, List<PostShortEntity>>> execute() {
    return postRepository.getPostsList();
  }
}
