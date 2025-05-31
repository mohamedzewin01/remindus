import 'Profile_datasource_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_manager/api_manager.dart';

@Injectable(as: ProfileDatasourceRepo)
class ProfileDatasourceRepoImpl implements ProfileDatasourceRepo {
  final ApiService apiService;
  ProfileDatasourceRepoImpl(this.apiService);
}
