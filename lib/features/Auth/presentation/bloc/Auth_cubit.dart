import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import 'package:remindus/core/common/api_result.dart';
import 'package:remindus/features/Auth/domain/entities/user_entity.dart';
import '../../domain/useCases/Auth_useCase_repo.dart';

part 'Auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authUseCaseRepo) : super(AuthInitial());
  final AuthUseCaseRepo _authUseCaseRepo;


  Future<void> signIn({required String email, required String password}) async{
    emit(AuthLoginLoading());
    final result = await _authUseCaseRepo.signIn(email, password);
    switch (result) {
      case Success<UserSignInEntity?>():
        {
          if (!isClosed) {
            emit(AuthLoginSuccess(result.data!));
          }
        }
        break;
      case Fail<UserSignInEntity?>():
        {
          if (!isClosed) {
            emit(AuthLoginFailure(result.exception));
          }
        }
        break;
    }
  }
  Future<void> signUp({required String userName,required String email, required String password}) async{
    emit(AuthSingUpLoading());
    final result = await _authUseCaseRepo.signUp(userName,email, password);
    switch (result) {
      case Success<UserSignInEntity?>():
        {
          if (!isClosed) {
            emit(AuthSingUpSuccess(result.data!));
          }
        }
        break;
      case Fail<UserSignInEntity?>():
        {
          if (!isClosed) {
            emit(AuthSingUpFailure(result.exception));
          }
        }
        break;
    }
  }
  Future<void> signInWithGoogle() async{
    emit(AuthLoginLoading());
    final result = await _authUseCaseRepo.signInWithGoogle();
    switch (result) {
      case Success<UserSignInEntity?>():
        {
          if (!isClosed) {
            emit(AuthLoginSuccess(result.data!));
          }
        }
        break;
      case Fail<UserSignInEntity?>():
        {
          if (!isClosed) {
            emit(AuthLoginFailure(result.exception));
          }
        }
        break;
    }
  }
  Future<void> signInWithGithub() async{
    emit(AuthLoginLoading());
    final result = await _authUseCaseRepo.signInWithGithub();
    switch (result) {
      case Success<UserSignInEntity?>():
        {
          if (!isClosed) {
            emit(AuthLoginSuccess(result.data!));
          }
        }
        break;
      case Fail<UserSignInEntity?>():
        {
          if (!isClosed) {
            emit(AuthLoginFailure(result.exception));
          }
        }
        break;
    }
  }

}
