import '../repositories/AddEvent_repository.dart';
import 'package:injectable/injectable.dart';
import '../useCases/AddEvent_useCase_repo.dart';

@Injectable(as: AddEventUseCaseRepo)
class AddEventUseCase implements AddEventUseCaseRepo {
  final AddEventRepository repository;

  AddEventUseCase(this.repository);

  // Future<Result<T>> call(...) async {
  //   return await repository.get...();
  // }
}
