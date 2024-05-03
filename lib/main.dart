import 'package:flutter/material.dart';
import 'package:oydeeedashboard/src/core/core.dart';
import 'package:oydeeedashboard/src/core/di/injector.dart';

import 'src/bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bootstrap(() => MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final AppRouter _appRouter = getIt<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1980, 1080),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'root',
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(
            navigatorObservers: () => [],
            deepLinkBuilder: (deepLink) {
              return deepLink;
            },
          ),
          builder: (context, child) {
            return child!;
          },
        ));
  }
}
