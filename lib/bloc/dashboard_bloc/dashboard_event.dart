abstract class DashboardEvent {}

class SetDashboardIndex extends DashboardEvent {
  final int index;
  SetDashboardIndex({required this.index});
}
