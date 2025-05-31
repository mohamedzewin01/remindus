import '../repositories/Auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../useCases/Auth_useCase_repo.dart';

@Injectable(as: AuthUseCaseRepo)
class AuthUseCase implements AuthUseCaseRepo {
  final AuthRepository repository;

  AuthUseCase(this.repository);

  // Future<Result<T>> call(...) async {
  //   return await repository.get...();
  // }
}
