import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeviceInterceptor extends Interceptor {
  DeviceInterceptor();


  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final deviceType = Platform.isAndroid ? 'Android' : 'Ios';
    // final deviceId = await .getDeviceId();
    // options.headers.addAll({
    //   'device-type': deviceType,
    //   'device-id': deviceId,
    //   'random': Random().nextInt(10),
    // });
    handler.next(options);
  }
}
