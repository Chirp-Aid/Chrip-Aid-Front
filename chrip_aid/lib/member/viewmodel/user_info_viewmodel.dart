import 'package:chrip_aid/auth/model/entity/user_entity.dart';
import 'package:chrip_aid/auth/model/service/auth_service.dart';
import 'package:chrip_aid/auth/model/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userInfoViewmodelProvider =
    ChangeNotifierProvider((ref) => UserInfoViewmodel(ref));

class UserInfoViewmodel extends ChangeNotifier {
  Ref ref;

  late AuthState state;

  UserEntity? get userInfo =>
      state is AuthStateSuccess ? (state as AuthStateSuccess).data : null;

  UserInfoViewmodel(this.ref) {
    state = ref.read(authServiceProvider);
  }
}