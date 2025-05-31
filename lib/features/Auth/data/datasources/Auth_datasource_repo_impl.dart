import 'Auth_datasource_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_manager/api_manager.dart';

@Injectable(as: AuthDatasourceRepo)
class AuthDatasourceRepoImpl implements AuthDatasourceRepo {
  final ApiService apiService;
  AuthDatasourceRepoImpl(this.apiService);
}
