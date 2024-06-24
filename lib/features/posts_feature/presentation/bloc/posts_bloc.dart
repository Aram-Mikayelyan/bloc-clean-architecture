import 'package:bloc_search/features/posts_feature/domain/use_cases/get_posts.dart';
import 'package:bloc_search/features/posts_feature/presentation/bloc/posts_event.dart';
import 'package:bloc_search/features/posts_feature/presentation/bloc/posts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPostsUseCase getPostsUseCase;
  PostsBloc(this.getPostsUseCase) : super(Loading()) {
    on<GetPosts>((event, emit) async {
      emit(Loading());
      final result = await getPostsUseCase.execute();
      result.fold(
        (failure) {
          emit(PostsLoadFailure(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(PostsEmpty());
          }
          emit(LoadedPosts(posts: data));
        },
      );
    });
  }
}
