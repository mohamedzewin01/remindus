import '../repositories/Events_repository.dart';
import 'package:injectable/injectable.dart';
import '../useCases/Events_useCase_repo.dart';

@Injectable(as: EventsUseCaseRepo)
class EventsUseCase implements EventsUseCaseRepo {
  final EventsRepository repository;

  EventsUseCase(this.repository);

  // Future<Result<T>> call(...) async {
  //   return await repository.get...();
  // }
}
