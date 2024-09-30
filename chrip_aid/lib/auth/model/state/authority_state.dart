import 'package:chrip_aid/common/local_storage/local_storage.dart';
import 'package:chrip_aid/common/utils/log_util.dart';
import 'package:chrip_aid/common/value_state/state/value_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthorityState extends ValueStateNotifier<AuthorityType> {
  static AuthorityState? _instance;

  AuthorityState._();

  factory AuthorityState() => _instance ??= AuthorityState._();
}

enum AuthorityType {
  user,
  orphanage,
  admin;

  @override
  String toString() {
    switch (this) {
      case user:
        return 'users';
      case orphanage:
        return 'orphanages';
      case admin:
        return 'admin';
    }
  }

  static AuthorityType fromString(String? value) =>
      AuthorityType.values.firstWhereOrNull((e) => e.toString() == value) ??
      AuthorityType.user;
}

Future initAuthority() async {
  final ref = ProviderContainer();
  final value = await ref.read(localStorageProvider).read(key: 'authority');
  logging("init Authority", value ?? "null");
  final authority = AuthorityType.fromString(value);
  AuthorityState().success(value: authority);
}

void toggleAuthority() {
  AuthorityState state = AuthorityState();
  if (state.value == AuthorityType.user) {
    AuthorityState().success(value: AuthorityType.orphanage);
  } else {
    AuthorityState().success(value: AuthorityType.user);
  }
}

Future saveAuthority() async {
  if (!AuthorityState().isSuccess) return;
  final ref = ProviderContainer();
  final authority = AuthorityState().value;
  final value = authority.toString();
  logging("save Authority", value);
  await ref.read(localStorageProvider).write(key: 'authority', value: value);
}
