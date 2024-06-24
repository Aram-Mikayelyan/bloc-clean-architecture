abstract class PostEvent {}

class GetSinglePost extends PostEvent {
  final int postId;
  GetSinglePost({required this.postId});
}
