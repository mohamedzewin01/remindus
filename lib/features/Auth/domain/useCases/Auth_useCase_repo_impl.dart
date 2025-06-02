import 'package:firebase_auth/firebase_auth.dart';
import 'package:remindus/core/common/api_result.dart';
import 'package:remindus/features/Auth/domain/entities/user_entity.dart';
import '../repositories/Auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../useCases/Auth_useCase_repo.dart';

@Injectable(as: AuthUseCaseRepo)
class AuthUseCase implements AuthUseCaseRepo {
  final AuthRepository repository;

  AuthUseCase(this.repository);

  @override
  Future<Result<UserSignInEntity?>> signIn(String email, String password) {
   return repository.signIn(email, password);
  }

  @override
  Future<Result<UserSignInEntity?>> signUp(String userName, String email, String password) {
    return repository.signUp(userName, email, password);
  }

  @override
  Future<Result<UserSignInEntity?>> signInWithGoogle() {
    return repository.signInWithGoogle();
  }

  @override
  Future<Result<UserSignInEntity?>> signInWithGithub() {
   return repository.signInWithGithub();
  }

}
