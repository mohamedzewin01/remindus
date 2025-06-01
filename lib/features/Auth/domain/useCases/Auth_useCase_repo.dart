import 'package:firebase_auth/firebase_auth.dart';
import 'package:remindus/core/common/api_result.dart';
import 'package:remindus/features/Auth/domain/entities/user_entity.dart';

abstract class AuthUseCaseRepo {
  Future<Result<UserSignInEntity?>> signIn(String email, String password);

  Future<Result<UserSignInEntity?>> signUp(
    String userName,
    String email,
    String password,
  );

  Future<Result<UserSignInEntity?>> signInWithGoogle();
}
