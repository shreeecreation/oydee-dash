import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/di/injector.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (kDebugMode) {
      print(details);
    }
  };

  await _initDependencies();
  // Future.delayed(const Duration(milliseconds: 3000), () {});
}

Future<void> _initDependencies() async {
  // await Hive.initFlutter();
  // Hive.registerAdapter(SessionAdapter());
  // await Hive.openBox<SessionEntity>(StorageKeys.sessionBox, encryptionCipher: await EncryptionHelper.encryptionKey);
  // await Hive.openBox<Map<String, dynamic>>(StorageKeys.cacheBox);
  await configureInjection();
}
