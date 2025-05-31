import 'Event_Details_datasource_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_manager/api_manager.dart';

@Injectable(as: EventDetailsDatasourceRepo)
class EventDetailsDatasourceRepoImpl implements EventDetailsDatasourceRepo {
  final ApiService apiService;
  EventDetailsDatasourceRepoImpl(this.apiService);
}
