import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import '../../domain/useCases/Auth_useCase_repo.dart';

part 'Auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authUseCaseRepo) : super(AuthInitial());
  final AuthUseCaseRepo _authUseCaseRepo;
}
