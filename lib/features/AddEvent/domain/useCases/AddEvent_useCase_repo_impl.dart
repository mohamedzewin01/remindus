import 'package:remindus/core/common/api_result.dart';
import 'package:remindus/features/AddEvent/data/models/add_event_model.dart';

import '../repositories/AddEvent_repository.dart';
import 'package:injectable/injectable.dart';
import '../useCases/AddEvent_useCase_repo.dart';

@Injectable(as: AddEventUseCaseRepo)
class AddEventUseCase implements AddEventUseCaseRepo {
  final AddEventRepository repository;

  AddEventUseCase(this.repository);

  @override
  Future<Result<void>> createSampleEvent( EventModel eventModel) {
  return repository.createSampleEvent(eventModel);
  }

  @override
  Future<Result<Participant?>> getParticipantByNameOrEmail(String query) {
    return repository.getParticipantByNameOrEmail(query);
  }


}
