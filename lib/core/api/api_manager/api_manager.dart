
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:remindus/core/api/api_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';


part 'api_manager.g.dart';

@injectable
@singleton
@RestApi()
abstract class ApiService {
  @FactoryMethod()
  factory ApiService(Dio dio) = _ApiService;


}


