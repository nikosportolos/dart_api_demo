import 'package:api_data_source/api_data_source.dart' as api;
import 'package:dotenv/dotenv.dart';
import 'package:orm/logger.dart';
import 'package:sql_server_data_source/prisma_client.dart';
import 'package:uuid/uuid.dart';

class SqlServerUserDataSource implements api.UserDataSource {
  final env = DotEnv()..load();
  late final PrismaClient _prismaClient;

  SqlServerUserDataSource() {
    _prismaClient = PrismaClient(
      stdout: [
        Event.error,
        Event.warn,
        // Event.query,
      ],
      datasources: Datasources(
        db: env['DATABASE_URL'],
      ),
    );
  }

  @override
  Future<api.User> create(api.User user) async {
    final createdUser = await _prismaClient.user.create(
      data: user.toUserCreateInput(),
    );

    return createdUser.convert();
  }

  @override
  Future<List<api.User>> readAll() async {
    return (await _prismaClient.user.findMany()).map((e) {
      return e.convert();
    }).toList(growable: false);
  }

  @override
  Future<api.User?> read(String id) async {
    final user = await _prismaClient.user.findUnique(
      where: UserWhereUniqueInput(id: id),
    );

    if (user == null) {
      throw Exception('User not found');
    }

    return user.convert();
  }

  @override
  Future<api.User> update(String id, api.User user) async {
    final dbUser = await _prismaClient.user.update(
      data: user.toUserUpdateInput(),
      where: UserWhereUniqueInput(id: id),
    );

    if (dbUser == null) {
      throw Exception('Failed to update user');
    }

    return dbUser.convert();
  }

  @override
  Future<void> delete(String id) async {
    await _prismaClient.user.delete(
      where: UserWhereUniqueInput(id: id),
    );
  }

  @override
  Future<void> deleteAll() async {
    await _prismaClient.user.deleteMany();
  }

  @override
  Future<void> dispose() async {
    await _prismaClient.$disconnect();
  }
}

extension on User {
  api.User convert() {
    return api.User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      alias: alias,
    );
  }
}

extension on api.User {
  UserCreateInput toUserCreateInput() {
    return UserCreateInput(
      id: const Uuid().v4(),
      firstName: firstName,
      lastName: lastName,
      email: email,
      alias: alias,
    );
  }

  UserUpdateInput toUserUpdateInput() {
    return UserUpdateInput(
      id: StringFieldUpdateOperationsInput(set: id),
      email: StringFieldUpdateOperationsInput(set: email),
      firstName: StringFieldUpdateOperationsInput(set: firstName),
      lastName: StringFieldUpdateOperationsInput(set: lastName),
      alias: NullableStringFieldUpdateOperationsInput(set: alias),
    );
  }
}
