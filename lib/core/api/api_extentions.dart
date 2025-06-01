import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import '../common/api_result.dart';
import '../common/custom_exception.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } on TimeoutException catch (_) {
    return Fail(NoInternetError());
  } on DioException catch (ex) {
    print(ex.response?.data);

    if (ex.response != null) {
      String message = ex.response?.data['message'] ?? 'Unexpected error occurred';

      return Fail(ServerError(
        ex.response?.statusCode,
        message,
      ));
    } else {

      return Fail(DioHttpException(ex));
    }


  } on IOException catch (_) {
    return Fail(NoInternetError());
  } on Exception catch (ex) {
    return Fail(ex);
  }
}
