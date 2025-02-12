import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'token_service.dart';

@lazySingleton
class AuthInterceptor extends QueuedInterceptorsWrapper {
  AuthInterceptor(this._tokenService);

  // final SessionService _service;
  final TokenService _tokenService;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
    //   final options = err.requestOptions;
    //   final accessToken = await _tokenService.refreshToken();
    //   if (accessToken == null || accessToken.isEmpty) {
    //     return handler.reject(err);
    //   } else {
    //     options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    //     try {
    //       final _res = await _tokenService.fetch(options);
    //       return handler.resolve(_res);
    //     } on DioException catch (e) {
    //       handler.next(e);
    //       return;
    //     }
    //   }
    // }
    if (err.response?.statusCode == 401) {
      // showModal<void>(
      //   context: getIt<AppRouter>().navigatorKey.currentContext!,
      //   builder: (context) => UnAuthorizedRequestWiidget(
      //     message: err.response?.data['message'] as String,
      //     title: err.response?.data['title'] as String,
      //   ),
      // );
      // UnAuthorizedRequestWiidget.show(
      //     context: getIt<AppRouter>().navigatorKey.currentContext!,
      //     message: err.response?.data['message'] as String,
      //     title: err.response?.data['title'] as String,
      //     callback: () {
      //       final context = getIt<AppRouter>().navigatorKey.currentContext;
      //       getIt<SessionService>().removeToken();
      //       context!.router.replaceAll([const LoginRoute()]);
      //     });
    }
    handler.reject(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // final hasSession = await _service.hasSession;
    const String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjdlY2UyMTM0LTYzYzQtNDNhOC1iZjU5LWE3OWQ4NzE1NDIzYiIsImlhdCI6MTcxNDkyMTgxOSwiZXhwIjoxNzE1MDA4MjE5LCJzdWIiOiI3ZWNlMjEzNC02M2M0LTQzYTgtYmY1OS1hNzlkODcxNTQyM2IifQ.NnPWPP1dYXpY44-Ipj5jOsZD3ni1x9-k82M5OOV9DNo";
    // if (hasSession) {
    //   final token = await _service.token;
    options.headers.addAll({'Authorization': 'Bearer $token'});
    // }
    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
