import 'package:injectable/injectable.dart';
import 'package:remindus/core/common/api_result.dart';
import 'package:remindus/features/AddEvent/data/datasources/AddEvent_datasource_repo.dart';
import 'package:remindus/features/AddEvent/data/models/add_event_model.dart';
import '../../domain/repositories/AddEvent_repository.dart';

@Injectable(as: AddEventRepository)
class AddEventRepositoryImpl implements AddEventRepository {
  final AddEventDatasourceRepo _addEventDatasourceRepo;

  AddEventRepositoryImpl(this._addEventDatasourceRepo);
  @override
  Future<Result<void>> createSampleEvent( EventModel eventModel) {
return _addEventDatasourceRepo.createSampleEvent( eventModel);
  }

  @override
  Future<Result<Participant?>> getParticipantByNameOrEmail(String query) {
  return _addEventDatasourceRepo.getParticipantByNameOrEmail(query);
  }
  // implementation
}
