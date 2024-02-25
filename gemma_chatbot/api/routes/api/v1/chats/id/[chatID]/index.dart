import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  if (context.request.method != HttpMethod.get) {
    return Response(
      statusCode: HttpStatus.methodNotAllowed,
      body: 'Only get request allowed',
    );
  }
  return _get(context);
}

Response _get(context) {
  return Response(body: 'Wellcome to Dart Frog!');
}
