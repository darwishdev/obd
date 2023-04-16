import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/features/user/data/datasources/user_local_data_source.dart';
import 'package:obd/routes/app_router.gr.dart';
import 'package:obd/utils/ui_helper.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    UiHelper.postBuildCallback((duration) {
      _onRefresh();
    });
  }

  void _onRefresh() {
    ref.read(userLocalDataSourceImpl).getUserData().then((userData) {
      if (userData == null) {
        context.replaceRoute(const LoginRoute());
        return;
      }
      context.replaceRoute(const BottomNavBarRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo.png', height: 250);
  }
}
