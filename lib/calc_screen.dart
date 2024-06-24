import 'package:bloc_search/bloc/calc_bloc/calc_bloc.dart';
import 'package:bloc_search/bloc/calc_bloc/calc_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcScreen extends StatelessWidget {
  const CalcScreen({
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<CalcBloc>().add(IncrementEvent());
                        },
                        child: const Text('increment'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: BlocBuilder<CalcBloc, int>(
                            builder: (context, state) {
                          return Text(state.toString());
                        }),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CalcBloc>().add(DecrementEvent());
                        },
                        child: const Text('decrement'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
