import '../repositories/Event_Details_repository.dart';
import 'package:injectable/injectable.dart';
import '../useCases/Event_Details_useCase_repo.dart';

@Injectable(as: EventDetailsUseCaseRepo)
class EventDetailsUseCase implements EventDetailsUseCaseRepo {
  final EventDetailsRepository repository;

  EventDetailsUseCase(this.repository);

  // Future<Result<T>> call(...) async {
  //   return await repository.get...();
  // }
}
