// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:obd/components/connect_page.dart' as _i13;
import 'package:obd/core/splash_page.dart' as _i1;
import 'package:obd/features/cars/presentations/screens/edit_car_screen.dart'
    as _i10;
import 'package:obd/features/home/presentation/home_page.dart' as _i2;
import 'package:obd/features/livedata/presentation/live_data_page.dart' as _i7;
import 'package:obd/features/nav_bar/presentation/screens/bottom_nav_bar_screen.dart'
    as _i6;
import 'package:obd/features/reviews/presentation/screens/create_review_screen.dart'
    as _i11;
import 'package:obd/features/reviews/presentation/screens/reviews_screen.dart'
    as _i12;
import 'package:obd/features/sessions/presentation/screens/history_screen.dart'
    as _i8;
import 'package:obd/features/sessions/presentation/screens/report_screen.dart'
    as _i9;
import 'package:obd/features/user/presentation/screens/login_screen.dart'
    as _i5;
import 'package:obd/features/user/presentation/screens/profile_screen.dart'
    as _i3;
import 'package:obd/features/user/presentation/screens/register_screen.dart'
    as _i4;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ProfileScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RegisterScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginScreen(),
      );
    },
    BottomNavBarRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.BottomNavBarScreen(),
      );
    },
    LiveDataRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LiveDataScreen(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HistoryScreen(),
      );
    },
    ReportRoute.name: (routeData) {
      final args = routeData.argsAs<ReportRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ReportScreen(
          args.sessionId,
          key: args.key,
        ),
      );
    },
    EditCarRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.EditCarScreen(),
      );
    },
    CreateReviewRoute.name: (routeData) {
      final args = routeData.argsAs<CreateReviewRouteArgs>(
          orElse: () => const CreateReviewRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.CreateReviewScreen(
          key: args.key,
          isProfile: args.isProfile,
        ),
      );
    },
    ReviewsRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ReviewsScreen(),
      );
    },
    ConnectPage.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ConnectPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ProfileScreen]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterRoute extends _i14.PageRouteInfo<void> {
  const RegisterRoute({List<_i14.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute({List<_i14.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.BottomNavBarScreen]
class BottomNavBarRoute extends _i14.PageRouteInfo<void> {
  const BottomNavBarRoute({List<_i14.PageRouteInfo>? children})
      : super(
          BottomNavBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavBarRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LiveDataScreen]
class LiveDataRoute extends _i14.PageRouteInfo<void> {
  const LiveDataRoute({List<_i14.PageRouteInfo>? children})
      : super(
          LiveDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'LiveDataRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HistoryScreen]
class HistoryRoute extends _i14.PageRouteInfo<void> {
  const HistoryRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ReportScreen]
class ReportRoute extends _i14.PageRouteInfo<ReportRouteArgs> {
  ReportRoute({
    required int? sessionId,
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ReportRoute.name,
          args: ReportRouteArgs(
            sessionId: sessionId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ReportRoute';

  static const _i14.PageInfo<ReportRouteArgs> page =
      _i14.PageInfo<ReportRouteArgs>(name);
}

class ReportRouteArgs {
  const ReportRouteArgs({
    required this.sessionId,
    this.key,
  });

  final int? sessionId;

  final _i15.Key? key;

  @override
  String toString() {
    return 'ReportRouteArgs{sessionId: $sessionId, key: $key}';
  }
}

/// generated route for
/// [_i10.EditCarScreen]
class EditCarRoute extends _i14.PageRouteInfo<void> {
  const EditCarRoute({List<_i14.PageRouteInfo>? children})
      : super(
          EditCarRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditCarRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.CreateReviewScreen]
class CreateReviewRoute extends _i14.PageRouteInfo<CreateReviewRouteArgs> {
  CreateReviewRoute({
    _i15.Key? key,
    bool isProfile = true,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          CreateReviewRoute.name,
          args: CreateReviewRouteArgs(
            key: key,
            isProfile: isProfile,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateReviewRoute';

  static const _i14.PageInfo<CreateReviewRouteArgs> page =
      _i14.PageInfo<CreateReviewRouteArgs>(name);
}

class CreateReviewRouteArgs {
  const CreateReviewRouteArgs({
    this.key,
    this.isProfile = true,
  });

  final _i15.Key? key;

  final bool isProfile;

  @override
  String toString() {
    return 'CreateReviewRouteArgs{key: $key, isProfile: $isProfile}';
  }
}

/// generated route for
/// [_i12.ReviewsScreen]
class ReviewsRoute extends _i14.PageRouteInfo<void> {
  const ReviewsRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ReviewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReviewsRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ConnectPage]
class ConnectPage extends _i14.PageRouteInfo<void> {
  const ConnectPage({List<_i14.PageRouteInfo>? children})
      : super(
          ConnectPage.name,
          initialChildren: children,
        );

  static const String name = 'ConnectPage';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}
