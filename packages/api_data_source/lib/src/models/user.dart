import 'package:data_class_plugin/data_class_plugin.dart';

part 'user.gen.dart';

@DataClass()
abstract class User {
  User.ctor();

  /// Default constructor
  factory User({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    String? alias,
  }) = _$UserImpl;

  String get id;

  String get firstName;

  String get lastName;

  String get email;

  String? get alias;

  /// Returns a string with the properties of [User]
  @override
  String toString() {
    String value = 'User{<optimized out>}';
    assert(() {
      value = 'User@<$hexIdentity>{id: $id, firstName: $firstName, lastName: $lastName, email: $email, alias: $alias}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      id,
      firstName,
      lastName,
      email,
      alias,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is User &&
            runtimeType == other.runtimeType &&
            id == other.id &&
            firstName == other.firstName &&
            lastName == other.lastName &&
            email == other.email &&
            alias == other.alias;
  }

  /// Creates a new instance of [User] with optional new values
  User copyWith({
    final String? id,
    final String? firstName,
    final String? lastName,
    final String? email,
    final String? alias,
  });

  /// Creates an instance of [User] from [json]
  factory User.fromJson(Map<dynamic, dynamic> json) = _$UserImpl.fromJson;

  /// Converts [User] to a [Map] json
  Map<String, dynamic> toJson();
}
