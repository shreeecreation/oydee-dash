import 'package:auto_route/auto_route.dart';
import 'app_router.dart';
export 'app_routes.dart';
export 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
   

    //Auth Routes
    AutoRoute(
      page: LoginRoute.page,
      path: AppRoutes.loginPage,
    ),
  
  ];
}

@RoutePage()
class NoticeWrapperPage extends AutoRouter {
  const NoticeWrapperPage({super.key});
}
