import 'package:chrip_aid/auth/model/service/auth_service.dart';
import 'package:chrip_aid/auth/model/state/auth_state.dart';
import 'package:chrip_aid/auth/model/state/authority_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final supervisorViewModelProvider = Provider((ref) => SupervisorViewModel(ref));


class SupervisorViewModel{
  final Ref ref;
  late AuthService _service;

  final AuthState authState = AuthState();

  final AuthorityState authorityState = AuthorityState();

  SupervisorViewModel(this.ref) {
    _service = ref.read(authServiceProvider);
  }
}