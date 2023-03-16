import 'package:api_data_source/api_data_source.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:sql_server_data_source/sql_server_data_source.dart';

// final _dataSource = InMemoryUserSource();
final _dataSource = SqlServerUserDataSource();

Handler middleware(Handler handler) {
  return handler //
      .use(requestLogger())
      .use(provider<UserDataSource>((_) => _dataSource));
}
