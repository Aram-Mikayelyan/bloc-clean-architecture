import 'package:bloc_search/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:bloc_search/bloc/dashboard_bloc/dashboard_event.dart';
import 'package:bloc_search/calc_screen.dart';
import 'package:bloc_search/features/posts_feature/presentation/screens/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashboardBloc, int>(builder: (context, state) {
        switch (state) {
          case 0:
            return const PostsScreen();
          case 1:
            return const CalcScreen();
          default:
            return const PostsScreen();
        }
      }),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<DashboardBloc, int>(builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    context
                        .read<DashboardBloc>()
                        .add(SetDashboardIndex(index: 0));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: state == 0 ? Colors.red : null,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: state == 0 ? Colors.red : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    context
                        .read<DashboardBloc>()
                        .add(SetDashboardIndex(index: 1));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.book_sharp,
                        color: state == 1 ? Colors.red : null,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: state == 1 ? Colors.red : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    context
                        .read<DashboardBloc>()
                        .add(SetDashboardIndex(index: 2));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.settings,
                        color: state == 2 ? Colors.red : null,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                          color: state == 2 ? Colors.red : null,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
