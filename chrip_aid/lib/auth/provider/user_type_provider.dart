import 'package:flutter_riverpod/flutter_riverpod.dart';

final authorityProvider = StateProvider((ref) => AuthorityType.orphanage);

enum AuthorityType {
  user,
  orphanage;

  @override
  String toString() {
    switch (this) {
      case user:
        return 'users';
      case orphanage:
        return 'orphanages';
    }
  }
}
