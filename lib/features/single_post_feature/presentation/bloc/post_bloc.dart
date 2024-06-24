import 'package:bloc_search/features/single_post_feature/presentation/bloc/post_event.dart';
import 'package:bloc_search/features/single_post_feature/presentation/bloc/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_single_post.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetSinglePostUseCase getSinglePostUseCase;

  PostBloc(this.getSinglePostUseCase) : super(PostLoading()) {
    on<GetSinglePost>(
      (event, emit) async {
        emit(PostLoading());
        final res = await getSinglePostUseCase.execute(event.postId);
        res.fold(
          (failure) {
            emit(PostLoadingFailure(failure.message));
          },
          (data) {
            emit(PostLoaded(post: data));
          },
        );
      },
    );
  }
}
