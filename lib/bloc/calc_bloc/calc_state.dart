abstract class CalcState {}

class InitialState extends CalcState {
  int initialCount = 0;
}

class CurrentState extends CalcState {
  final int counter;
  CurrentState({required this.counter});
}
