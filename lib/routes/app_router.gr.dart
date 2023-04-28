// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:obd/components/connect_page.dart' as _i15;
import 'package:obd/components/live_data_page.dart' as _i14;
import 'package:obd/core/splash_page.dart' as _i1;
import 'package:obd/features/cars/presentations/screens/edit_car_screen.dart'
    as _i11;
import 'package:obd/features/centers/presentation/screens/centers_screen.dart'
    as _i3;
import 'package:obd/features/centers/presentation/screens/winches_screen.dart'
    as _i4;
import 'package:obd/features/home/presentation/home_page.dart' as _i2;
import 'package:obd/features/nav_bar/presentation/screens/bottom_nav_bar_screen.dart'
    as _i8;
import 'package:obd/features/reviews/presentation/screens/create_review_screen.dart'
    as _i12;
import 'package:obd/features/reviews/presentation/screens/reviews_screen.dart'
    as _i13;
import 'package:obd/features/sessions/presentation/screens/history_screen.dart'
    as _i9;
import 'package:obd/features/sessions/presentation/screens/report_screen.dart'
    as _i10;
import 'package:obd/features/user/presentation/screens/login_screen.dart'
    as _i7;
import 'package:obd/features/user/presentation/screens/profile_screen.dart'
    as _i5;
import 'package:obd/features/user/presentation/screens/register_screen.dart'
    as _i6;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    CentersRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CentersScreen(),
      );
    },
    WinchesRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.WinchesScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfileScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RegisterScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginScreen(),
      );
    },
    BottomNavBarRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.BottomNavBarScreen(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HistoryScreen(),
      );
    },
    ReportRoute.name: (routeData) {
      final args = routeData.argsAs<ReportRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.ReportScreen(
          args.sessionId,
          key: args.key,
        ),
      );
    },
    EditCarRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.EditCarScreen(),
      );
    },
    CreateReviewRoute.name: (routeData) {
      final args = routeData.argsAs<CreateReviewRouteArgs>(
          orElse: () => const CreateReviewRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.CreateReviewScreen(
          key: args.key,
          isProfile: args.isProfile,
        ),
      );
    },
    ReviewsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ReviewsScreen(),
      );
    },
    LiveDataRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.LiveDataScreen(),
      );
    },
    ConnectPage.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ConnectPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i16.PageRouteInfo<void> {
  const SplashRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CentersScreen]
class CentersRoute extends _i16.PageRouteInfo<void> {
  const CentersRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CentersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CentersRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.WinchesScreen]
class WinchesRoute extends _i16.PageRouteInfo<void> {
  const WinchesRoute({List<_i16.PageRouteInfo>? children})
      : super(
          WinchesRoute.name,
          initialChildren: children,
        );

  static const String name = 'WinchesRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RegisterScreen]
class RegisterRoute extends _i16.PageRouteInfo<void> {
  const RegisterRoute({List<_i16.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoginScreen]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.BottomNavBarScreen]
class BottomNavBarRoute extends _i16.PageRouteInfo<void> {
  const BottomNavBarRoute({List<_i16.PageRouteInfo>? children})
      : super(
          BottomNavBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavBarRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HistoryScreen]
class HistoryRoute extends _i16.PageRouteInfo<void> {
  const HistoryRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ReportScreen]
class ReportRoute extends _i16.PageRouteInfo<ReportRouteArgs> {
  ReportRoute({
    required int? sessionId,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ReportRoute.name,
          args: ReportRouteArgs(
            sessionId: sessionId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ReportRoute';

  static const _i16.PageInfo<ReportRouteArgs> page =
      _i16.PageInfo<ReportRouteArgs>(name);
}

class ReportRouteArgs {
  const ReportRouteArgs({
    required this.sessionId,
    this.key,
  });

  final int? sessionId;

  final _i17.Key? key;

  @override
  String toString() {
    return 'ReportRouteArgs{sessionId: $sessionId, key: $key}';
  }
}

/// generated route for
/// [_i11.EditCarScreen]
class EditCarRoute extends _i16.PageRouteInfo<void> {
  const EditCarRoute({List<_i16.PageRouteInfo>? children})
      : super(
          EditCarRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditCarRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.CreateReviewScreen]
class CreateReviewRoute extends _i16.PageRouteInfo<CreateReviewRouteArgs> {
  CreateReviewRoute({
    _i17.Key? key,
    bool isProfile = true,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          CreateReviewRoute.name,
          args: CreateReviewRouteArgs(
            key: key,
            isProfile: isProfile,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateReviewRoute';

  static const _i16.PageInfo<CreateReviewRouteArgs> page =
      _i16.PageInfo<CreateReviewRouteArgs>(name);
}

class CreateReviewRouteArgs {
  const CreateReviewRouteArgs({
    this.key,
    this.isProfile = true,
  });

  final _i17.Key? key;

  final bool isProfile;

  @override
  String toString() {
    return 'CreateReviewRouteArgs{key: $key, isProfile: $isProfile}';
  }
}

/// generated route for
/// [_i13.ReviewsScreen]
class ReviewsRoute extends _i16.PageRouteInfo<void> {
  const ReviewsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ReviewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReviewsRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.LiveDataScreen]
class LiveDataRoute extends _i16.PageRouteInfo<void> {
  const LiveDataRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LiveDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'LiveDataRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i15.ConnectPage]
class ConnectPage extends _i16.PageRouteInfo<void> {
  const ConnectPage({List<_i16.PageRouteInfo>? children})
      : super(
          ConnectPage.name,
          initialChildren: children,
        );

  static const String name = 'ConnectPage';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
