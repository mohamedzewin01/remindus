import 'Events_datasource_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_manager/api_manager.dart';

@Injectable(as: EventsDatasourceRepo)
class EventsDatasourceRepoImpl implements EventsDatasourceRepo {
  final ApiService apiService;
  EventsDatasourceRepoImpl(this.apiService);
}
