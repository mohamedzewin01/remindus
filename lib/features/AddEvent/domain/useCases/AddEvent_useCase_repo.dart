import 'package:remindus/core/common/api_result.dart';
import 'package:remindus/features/AddEvent/data/models/add_event_model.dart';

abstract class AddEventUseCaseRepo {
  Future<Result<void>> createSampleEvent( EventModel eventModel);
  Future<Result<Participant?>> getParticipantByNameOrEmail(String query);
}
