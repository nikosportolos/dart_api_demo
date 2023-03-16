import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:api_data_source/api_data_source.dart';
import 'package:dart_frog/dart_frog.dart';

FutureOr<Response> onRequest(RequestContext context, String id) async {
  final dataSource = context.read<UserDataSource>();
  final user = await dataSource.read(id);

  if (user == null) {
    return Response(
      statusCode: HttpStatus.notFound,
      body: 'Not found',
    );
  }

  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, user);

    case HttpMethod.put:
      final json = await context.request.body();
      final newUser = User.fromJson(jsonDecode(json) as Map<String, dynamic>);
      return _put(context, id, newUser);

    case HttpMethod.delete:
      return _delete(context, id);

    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.post:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, User user) async {
  return Response.json(body: user);
}

Future<Response> _put(RequestContext context, String id, User user) async {
  final dataSource = context.read<UserDataSource>();
  final newUser = await dataSource.update(id, user);

  return Response.json(body: newUser);
}

Future<Response> _delete(RequestContext context, String id) async {
  final dataSource = context.read<UserDataSource>();
  await dataSource.delete(id);

  return Response(statusCode: HttpStatus.noContent);
}
