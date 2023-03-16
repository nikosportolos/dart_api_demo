import 'package:api_data_source/api_data_source.dart';
import 'package:uuid/uuid.dart';

class InMemoryUserSource implements UserDataSource {
  final Map<String, User> _cache = <String, User>{};

  @override
  Future<User> create(User user) async {
    final String id = const Uuid().v4();
    final User createdUser = user.copyWith(id: id);
    _cache[id] = createdUser;

    return createdUser;
  }

  @override
  Future<List<User>> readAll() async {
    return _cache.values.toList();
  }

  @override
  Future<User?> read(String id) async {
    return _cache[id];
  }

  @override
  Future<User> update(String id, User user) async {
    return _cache.update(id, (User value) => user);
  }

  @override
  Future<void> delete(String id) async {
    _cache.remove(id);
  }

  @override
  Future<void> deleteAll() async {
    _cache.clear();
  }

  @override
  Future<void> dispose() async {
    _cache.clear();
  }
}
