import 'package:bloc_search/core/error/failure.dart';
import 'package:bloc_search/features/posts_feature/domain/entities/post_short.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostShortEntity>>> getPostsList();
}
