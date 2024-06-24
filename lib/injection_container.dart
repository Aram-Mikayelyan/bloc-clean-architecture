import 'package:bloc_search/features/posts_feature/data/data_sources/post_remote_source.dart';
import 'package:bloc_search/features/posts_feature/domain/repositories/post_repository.dart';
import 'package:bloc_search/features/posts_feature/domain/use_cases/get_posts.dart';
import 'package:bloc_search/features/single_post_feature/domain/use_cases/get_single_post.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/posts_feature/data/repositories/post_repository_impl.dart';
import 'features/posts_feature/presentation/bloc/posts_bloc.dart';
import 'features/single_post_feature/data/data_sources/single_post_remote_source.dart';
import 'features/single_post_feature/data/repositories/single_post_repositories_impl.dart';
import 'features/single_post_feature/domain/repositories/single_post_repositories.dart';
import 'features/single_post_feature/presentation/bloc/post_bloc.dart';

final locator = GetIt.instance;

void setupLocator() {
  // bloc
  locator.registerFactory(() => PostsBloc(locator()));

  locator.registerFactory(() => PostBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetPostsUseCase(locator()));
  locator.registerLazySingleton(() => GetSinglePostUseCase(locator()));

  // repository
  locator.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(postRemoteSource: locator()),
  );
  locator.registerLazySingleton<SinglePostRepository>(
    () => SinglePostRepositoryImpl(singlePostRemoteSource: locator()),
  );

  // data source
  locator.registerLazySingleton<PostRemoteSource>(
    () => PostRemoteSourceImpl(),
  );
  locator.registerLazySingleton<SinglePostRemoteSource>(
    () => SinglePostRemoteSourceImpl(),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
