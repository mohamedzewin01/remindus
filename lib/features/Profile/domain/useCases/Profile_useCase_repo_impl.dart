import '../repositories/Profile_repository.dart';
import 'package:injectable/injectable.dart';
import '../useCases/Profile_useCase_repo.dart';

@Injectable(as: ProfileUseCaseRepo)
class ProfileUseCase implements ProfileUseCaseRepo {
  final ProfileRepository repository;

  ProfileUseCase(this.repository);

  // Future<Result<T>> call(...) async {
  //   return await repository.get...();
  // }
}
