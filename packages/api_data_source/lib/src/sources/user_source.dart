import 'package:api_data_source/src/models/user.dart';

abstract class UserDataSource {
  Future<User> create(User user);

  Future<List<User>> readAll();

  Future<User?> read(String id);

  Future<User> update(String id, User user);

  Future<void> delete(String id);

  Future<void> deleteAll();

  Future<void> dispose();
}
