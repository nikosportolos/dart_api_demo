// AUTO GENERATED - DO NOT MODIFY

part of 'user.dart';

class _$UserImpl extends User {
  _$UserImpl({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.alias,
  }) : super.ctor();

  @override
  final String id;

  @override
  final String firstName;

  @override
  final String lastName;

  @override
  final String email;

  @override
  final String? alias;

  factory _$UserImpl.fromJson(Map<dynamic, dynamic> json) {
    return _$UserImpl(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      alias: json['alias'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'alias': alias,
    };
  }

  @override
  _$UserImpl copyWith({
    final String? id,
    final String? firstName,
    final String? lastName,
    final String? email,
    final Object? alias = const Object(),
  }) {
    return _$UserImpl(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      alias: identical(alias, const Object()) ? this.alias : (alias as String?),
    );
  }

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

  @override
  String toString() {
    String toStringOutput = 'User{<optimized out>}';
    assert(() {
      toStringOutput =
          'User@<$hexIdentity>{id: $id, firstName: $firstName, lastName: $lastName, email: $email, alias: $alias}';
      return true;
    }());
    return toStringOutput;
  }

  @override
  Type get runtimeType => User;
}
