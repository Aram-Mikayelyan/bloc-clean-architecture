import 'dart:io';

import 'package:bloc_search/core/error/exception.dart';
import 'package:bloc_search/core/error/failure.dart';
import 'package:bloc_search/features/single_post_feature/data/data_sources/single_post_remote_source.dart';
import 'package:bloc_search/features/single_post_feature/domain/entities/post.dart';
import 'package:bloc_search/features/single_post_feature/domain/repositories/single_post_repositories.dart';
import 'package:dartz/dartz.dart';

class SinglePostRepositoryImpl extends SinglePostRepository {
  final SinglePostRemoteSource singlePostRemoteSource;
  SinglePostRepositoryImpl({required this.singlePostRemoteSource});

  @override
  Future<Either<Failure, PostEntity>> getPost(int postId) async {
    try {
      final res = await singlePostRemoteSource.getPost(postId);
      return Right(res.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
