import 'package:bloc_search/features/posts_feature/presentation/bloc/posts_bloc.dart';
import 'package:bloc_search/features/posts_feature/presentation/bloc/posts_state.dart';
import 'package:bloc_search/features/single_post_feature/presentation/bloc/post_bloc.dart';
import 'package:bloc_search/features/single_post_feature/presentation/bloc/post_event.dart';
import 'package:bloc_search/features/single_post_feature/presentation/screens/post_screen.dart';
import 'package:bloc_search/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Bloc Search'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<PostsBloc, PostsState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is PostsEmpty) {
                    return const Expanded(
                      child: Center(
                        child: Text('There is no Posts found'),
                      ),
                    );
                  }
                  if (state is LoadedPosts) {
                    return Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return BlocProvider.value(
                                    value: locator<PostBloc>()
                                      ..add(GetSinglePost(
                                          postId: state.posts[i].id)),
                                    child: const PostScreen(),
                                  );
                                }));
                              },
                              child: Text(state.posts[i].title));
                        },
                        separatorBuilder: (_, i) => const Divider(),
                        itemCount: state.posts.length,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
