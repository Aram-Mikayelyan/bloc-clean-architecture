import 'dart:io';

import 'package:bloc_search/core/error/exception.dart';
import 'package:bloc_search/core/error/failure.dart';
import 'package:bloc_search/features/posts_feature/data/data_sources/post_remote_source.dart';
import 'package:bloc_search/features/posts_feature/domain/entities/post_short.dart';
import 'package:bloc_search/features/posts_feature/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl extends PostRepository {
  final PostRemoteSource postRemoteSource;
  PostRepositoryImpl({required this.postRemoteSource});

  @override
  Future<Either<Failure, List<PostShortEntity>>> getPostsList() async {
    try {
      final res = await postRemoteSource.getPosts();
      return Right(res.map((post) => post.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
