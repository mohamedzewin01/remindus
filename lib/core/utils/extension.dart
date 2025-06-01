import 'package:firebase_auth/firebase_auth.dart';
import 'package:remindus/features/Auth/domain/entities/user_entity.dart';

extension UserCredentialExtension on UserCredential {
  UserSignInEntity toUserEntity() {
    final user = this.user!;
    return UserSignInEntity(
      id: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
      image: user.photoURL ?? '',
    );
  }
}