import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../core.dart';
import '../network/auth_interceptor.dart';
import '../network/device_interceptor.dart';

@module
abstract class RegisterModules {

  @singleton
  AppRouter get router => AppRouter();



  @lazySingleton
  Dio dio(DeviceInterceptor deviceInterceptor, AuthInterceptor authInterceptor) => Dio(BaseOptions(
        baseUrl: '',
        receiveTimeout: const Duration(milliseconds: 60000),
        connectTimeout: const Duration(milliseconds: 60000),
        responseType: ResponseType.json,
        headers: <String, dynamic>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ))
        ..interceptors.addAll([
          if (kDebugMode)
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              responseHeader: true,
              error: true,
              compact: true,
              request: true,
            ),
          deviceInterceptor,
          authInterceptor,
        ]);
}
