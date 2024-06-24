import 'package:bloc_search/bloc/calc_bloc/calc_bloc.dart';
import 'package:bloc_search/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:bloc_search/dashboard_screen.dart';
import 'package:bloc_search/features/posts_feature/presentation/bloc/posts_bloc.dart';
import 'package:bloc_search/features/posts_feature/presentation/bloc/posts_event.dart';
import 'package:bloc_search/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<PostsBloc>()..add(GetPosts()),
        ),
        BlocProvider(
          create: (_) => CalcBloc(),
        ),
        BlocProvider(
          create: (_) => DashboardBloc(),
        )
      ],
      child: const MaterialApp(
        home: DashboardScreen(),
      ),
    );
  }
}
