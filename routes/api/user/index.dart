import 'dart:async';
import 'dart:io';

import 'package:api_data_source/api_data_source.dart';
import 'package:dart_frog/dart_frog.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);

    case HttpMethod.post:
      return _post(context);

    case HttpMethod.delete:
      return _delete(context);

    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context) async {
  final dataSource = context.read<UserDataSource>();
  final users = await dataSource.readAll();

  return Response.json(body: users);
}

Future<Response> _post(RequestContext context) async {
  final dataSource = context.read<UserDataSource>();
  final user = User.fromJson(
    await context.request.json() as Map<String, dynamic>,
  );

  return Response.json(
    statusCode: HttpStatus.created,
    body: await dataSource.create(user),
  );
}

Future<Response> _delete(RequestContext context) async {
  final dataSource = context.read<UserDataSource>();
  await dataSource.deleteAll();

  return Response(statusCode: HttpStatus.noContent);
}
