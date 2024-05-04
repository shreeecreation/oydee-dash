// [BaseRemoteSource] for handling network requests for dio client
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../core.dart';
import '../../di/injector.dart';
import '../error/api_exception.dart';
import '../error/app_error.dart';
import '../../network/network_info.dart';

class BaseRemoteSource {
  BaseRemoteSource(this._dio, this._networkInfo);
  final Dio _dio;
  final context = getIt<AppRouter>().navigatorKey.currentContext;
  final NetworkInfo _networkInfo;

  /// [T] is return type from network request
  ///
  /// [request] callback returns [Response] and accepts [Dio] instance
  ///
  /// [onResponse] callback returns [T] and accepts [dynamic] data from [Response]
  ///
  /// throws [ApiException]
  EitherResponse<T> networkRequest<T>({required Future<T> Function(Dio dio) request}) async {
    try {
      final response = await request(_dio);
      return right(response);
    } on ApiException catch (e) {
      return left(e.when(
        serverException: (message) => AppError.serverError(
          error: message,
        ),
        unprocessableEntity: (message, errors) => AppError.validationError(validationError: ValidationError(message: message, errors: errors)),
        unAuthorized: () => const AppError.serverError(
          error: 'UnAuthorized',
        ),
        network: () => const AppError.noInternet(error: NoInternetError()),
        formatException: () => const AppError.serverError(error: 'Something went wrong'),
      ));
    } on DioException catch (e) {
      return left(e.toException);
    }
  }
}

typedef EitherResponse<T> = Future<Either<AppError, T>>;
