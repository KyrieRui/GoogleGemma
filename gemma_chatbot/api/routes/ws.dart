import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    channel.stream.listen((message) {
      print('received message from the client/Flutter app: $message');
      channel.sink.add('received message: $message');

      try {
        // check what is the input from the clietnt
        // do with input
        // save it and use Gemini API (via chat respository) to get the response
      } catch (err) {}
    });
  });
  return Response(body: 'Wellcome to Dart Frog!');
}

// 14:23