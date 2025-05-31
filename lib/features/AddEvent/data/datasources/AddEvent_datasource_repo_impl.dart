import 'AddEvent_datasource_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_manager/api_manager.dart';

@Injectable(as: AddEventDatasourceRepo)
class AddEventDatasourceRepoImpl implements AddEventDatasourceRepo {
  final ApiService apiService;
  AddEventDatasourceRepoImpl(this.apiService);
}
