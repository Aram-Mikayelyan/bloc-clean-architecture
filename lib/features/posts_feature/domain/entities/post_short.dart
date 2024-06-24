import 'package:equatable/equatable.dart';

class PostShortEntity extends Equatable {
  const PostShortEntity({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  @override
  List<Object?> get props => [
        id,
        title,
      ];
}
