import 'package:data_class_plugin/data_class_plugin.dart';

@DataClass()
class User {
  /// Shorthand constructor
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.alias,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? alias;

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
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      alias: alias ?? this.alias,
    );
  }

  /// Creates an instance of [User] from [json]
  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      alias: json['alias'] == null ? null : json['alias'] as String,
    );
  }

  /// Converts [User] to a [Map] json
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'alias': alias,
    };
  }
}
