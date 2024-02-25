class ChatRepository {
  // stroe chat message
  final Map<String, List<Message>> _chatroom = {};

  Future<List<Message>> fetchMssages() async {
    throw UnimplementedError();
  }

  Future<Message> createUserMessage(
    String chatroomId,
    Map<String, dynamic> data,
  ) {
    throw UnimplementedError();
  }

  Stream<Message> createModelMessage(
    String chatroomId,
    Map<String, dynamic> data,
  ) {
    throw UnimplementedError();
  }
}
