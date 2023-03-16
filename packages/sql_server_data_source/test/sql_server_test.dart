import 'package:dotenv/dotenv.dart';
import 'package:orm/logger.dart';
import 'package:sql_server_data_source/prisma_client.dart';
import 'package:test/test.dart';

void main() {
  final env = DotEnv()..load();
  final PrismaClient _prismaClient = PrismaClient(
    stdout: [
      Event.error,
      Event.warn,
      // Event.query,
    ],
    datasources: Datasources(
      db: env['DATABASE_URL'],
    ),
  );

  group('SQL Server', () {
    //
  });
}
