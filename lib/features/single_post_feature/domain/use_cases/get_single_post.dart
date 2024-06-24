import 'package:bloc_search/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/post.dart';
import '../repositories/single_post_repositories.dart';

class GetSinglePostUseCase {
  final SinglePostRepository repository;

  GetSinglePostUseCase(this.repository);

  Future<Either<Failure, PostEntity>> execute(int postId) {
    return repository.getPost(postId);
  }
}
