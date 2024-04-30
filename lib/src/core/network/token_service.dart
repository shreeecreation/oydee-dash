import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:oydeeedashboard/src/core/core.dart';

import '../di/injector.dart';
import 'device_interceptor.dart';

@lazySingleton
class TokenService {
  TokenService() {
    _dio = Dio(BaseOptions(
      baseUrl: '',
      receiveTimeout: 60000.milliseconds,
      connectTimeout: 60000.milliseconds,
      responseType: ResponseType.json,
      headers: <String, dynamic>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ))
      ..interceptors.addAll([getIt<DeviceInterceptor>()]);
  }

  late Dio _dio;

  Future<Response<dynamic>> fetch(RequestOptions options) =>
      _dio.fetch(options);
}
