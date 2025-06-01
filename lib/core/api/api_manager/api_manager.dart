
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'api_manager.g.dart';

@injectable
@singleton
@RestApi()
abstract class ApiService {
  @FactoryMethod()
  factory ApiService(Dio dio) = _ApiService;


}

