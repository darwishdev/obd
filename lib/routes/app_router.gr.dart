// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i19;
import 'package:obd/components/live_data_page.dart' as _i15;
import 'package:obd/core/splash_page.dart' as _i1;
import 'package:obd/features/cars/presentations/screens/edit_car_screen.dart'
    as _i12;
import 'package:obd/features/centers/data/models/center_model.dart' as _i18;
import 'package:obd/features/centers/presentation/screens/center_details_screen.dart'
    as _i5;
import 'package:obd/features/centers/presentation/screens/centers_screen.dart'
    as _i3;
import 'package:obd/features/centers/presentation/screens/winches_screen.dart'
    as _i4;
import 'package:obd/features/home/presentation/screens/home_screen.dart' as _i2;
import 'package:obd/features/home/presentation/screens/obd_info_screen.dart'
    as _i16;
import 'package:obd/features/nav_bar/presentation/screens/bottom_nav_bar_screen.dart'
    as _i9;
import 'package:obd/features/reviews/presentation/screens/create_review_screen.dart'
    as _i13;
import 'package:obd/features/reviews/presentation/screens/reviews_screen.dart'
    as _i14;
import 'package:obd/features/sessions/presentation/screens/history_screen.dart'
    as _i10;
import 'package:obd/features/sessions/presentation/screens/report_screen.dart'
    as _i11;
import 'package:obd/features/user/presentation/screens/login_screen.dart'
    as _i8;
import 'package:obd/features/user/presentation/screens/profile_screen.dart'
    as _i6;
import 'package:obd/features/user/presentation/screens/register_screen.dart'
    as _i7;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    CentersRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CentersScreen(),
      );
    },
    WinchesRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.WinchesScreen(),
      );
    },
    CenterDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CenterDetailsRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CenterDetailsScreen(
          args.center,
          key: args.key,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProfileScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.RegisterScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LoginScreen(),
      );
    },
    BottomNavBarRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.BottomNavBarScreen(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.HistoryScreen(),
      );
    },
    ReportRoute.name: (routeData) {
      final args = routeData.argsAs<ReportRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ReportScreen(
          args.sessionId,
          key: args.key,
        ),
      );
    },
    EditCarRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.EditCarScreen(),
      );
    },
    CreateReviewRoute.name: (routeData) {
      final args = routeData.argsAs<CreateReviewRouteArgs>(
          orElse: () => const CreateReviewRouteArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.CreateReviewScreen(
          key: args.key,
          centerID: args.centerID,
          isProfile: args.isProfile,
        ),
      );
    },
    ReviewsRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ReviewsScreen(),
      );
    },
    LiveDataRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.LiveDataScreen(),
      );
    },
    OBDInfoRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.OBDInfoScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i17.PageRouteInfo<void> {
  const SplashRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute({List<_i17.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CentersScreen]
class CentersRoute extends _i17.PageRouteInfo<void> {
  const CentersRoute({List<_i17.PageRouteInfo>? children})
      : super(
          CentersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CentersRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i4.WinchesScreen]
class WinchesRoute extends _i17.PageRouteInfo<void> {
  const WinchesRoute({List<_i17.PageRouteInfo>? children})
      : super(
          WinchesRoute.name,
          initialChildren: children,
        );

  static const String name = 'WinchesRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CenterDetailsScreen]
class CenterDetailsRoute extends _i17.PageRouteInfo<CenterDetailsRouteArgs> {
  CenterDetailsRoute({
    required _i18.CenterModel center,
    _i19.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          CenterDetailsRoute.name,
          args: CenterDetailsRouteArgs(
            center: center,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CenterDetailsRoute';

  static const _i17.PageInfo<CenterDetailsRouteArgs> page =
      _i17.PageInfo<CenterDetailsRouteArgs>(name);
}

class CenterDetailsRouteArgs {
  const CenterDetailsRouteArgs({
    required this.center,
    this.key,
  });

  final _i18.CenterModel center;

  final _i19.Key? key;

  @override
  String toString() {
    return 'CenterDetailsRouteArgs{center: $center, key: $key}';
  }
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileRoute extends _i17.PageRouteInfo<void> {
  const ProfileRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RegisterScreen]
class RegisterRoute extends _i17.PageRouteInfo<void> {
  const RegisterRoute({List<_i17.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginScreen]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute({List<_i17.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i9.BottomNavBarScreen]
class BottomNavBarRoute extends _i17.PageRouteInfo<void> {
  const BottomNavBarRoute({List<_i17.PageRouteInfo>? children})
      : super(
          BottomNavBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavBarRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i10.HistoryScreen]
class HistoryRoute extends _i17.PageRouteInfo<void> {
  const HistoryRoute({List<_i17.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ReportScreen]
class ReportRoute extends _i17.PageRouteInfo<ReportRouteArgs> {
  ReportRoute({
    required int? sessionId,
    _i19.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ReportRoute.name,
          args: ReportRouteArgs(
            sessionId: sessionId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ReportRoute';

  static const _i17.PageInfo<ReportRouteArgs> page =
      _i17.PageInfo<ReportRouteArgs>(name);
}

class ReportRouteArgs {
  const ReportRouteArgs({
    required this.sessionId,
    this.key,
  });

  final int? sessionId;

  final _i19.Key? key;

  @override
  String toString() {
    return 'ReportRouteArgs{sessionId: $sessionId, key: $key}';
  }
}

/// generated route for
/// [_i12.EditCarScreen]
class EditCarRoute extends _i17.PageRouteInfo<void> {
  const EditCarRoute({List<_i17.PageRouteInfo>? children})
      : super(
          EditCarRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditCarRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i13.CreateReviewScreen]
class CreateReviewRoute extends _i17.PageRouteInfo<CreateReviewRouteArgs> {
  CreateReviewRoute({
    _i19.Key? key,
    int? centerID,
    bool isProfile = true,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          CreateReviewRoute.name,
          args: CreateReviewRouteArgs(
            key: key,
            centerID: centerID,
            isProfile: isProfile,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateReviewRoute';

  static const _i17.PageInfo<CreateReviewRouteArgs> page =
      _i17.PageInfo<CreateReviewRouteArgs>(name);
}

class CreateReviewRouteArgs {
  const CreateReviewRouteArgs({
    this.key,
    this.centerID,
    this.isProfile = true,
  });

  final _i19.Key? key;

  final int? centerID;

  final bool isProfile;

  @override
  String toString() {
    return 'CreateReviewRouteArgs{key: $key, centerID: $centerID, isProfile: $isProfile}';
  }
}

/// generated route for
/// [_i14.ReviewsScreen]
class ReviewsRoute extends _i17.PageRouteInfo<void> {
  const ReviewsRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ReviewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReviewsRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i15.LiveDataScreen]
class LiveDataRoute extends _i17.PageRouteInfo<void> {
  const LiveDataRoute({List<_i17.PageRouteInfo>? children})
      : super(
          LiveDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'LiveDataRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i16.OBDInfoScreen]
class OBDInfoRoute extends _i17.PageRouteInfo<void> {
  const OBDInfoRoute({List<_i17.PageRouteInfo>? children})
      : super(
          OBDInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'OBDInfoRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}
