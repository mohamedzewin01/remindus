import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:remindus/core/common/api_result.dart';
import 'package:remindus/features/Auth/data/datasources/Auth_datasource_repo.dart';
import 'package:remindus/features/Auth/domain/entities/user_entity.dart';
import '../../domain/repositories/Auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasourceRepo _authDatasourceRepo;
  AuthRepositoryImpl(this._authDatasourceRepo);
  @override
  Future<Result<UserSignInEntity?>> signIn(String email, String password) {
 return _authDatasourceRepo.signIn(email, password);
  }

  @override
  Future<Result<UserSignInEntity?>> signUp(String userName, String email, String password) {
    return _authDatasourceRepo.signUp(userName,email, password);
  }

  @override
  Future<Result<UserSignInEntity?>> signInWithGoogle() {
   return _authDatasourceRepo.signInWithGoogle();
  }

  @override
  Future<Result<UserSignInEntity?>> signInWithGithub() {
   return _authDatasourceRepo.signInWithGithub();
  }

}
