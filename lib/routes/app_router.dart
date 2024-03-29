import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: EditCarRoute.page),
    AutoRoute(page: ReviewsRoute.page),
    AutoRoute(
      page: BottomNavBarRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: HistoryRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),
    AutoRoute(page: CreateReviewRoute.page),
    AutoRoute(page: ReportRoute.page),
    AutoRoute(page: CentersRoute.page),
    AutoRoute(page: WinchesRoute.page),
    AutoRoute(page: CenterDetailsRoute.page),
    AutoRoute(page: OBDInfoRoute.page),
  ];
}
