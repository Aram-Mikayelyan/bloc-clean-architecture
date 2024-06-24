import 'package:bloc_search/core/error/failure.dart';
import 'package:bloc_search/features/single_post_feature/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class SinglePostRepository {
  Future<Either<Failure, PostEntity>> getPost(int postId);
}
