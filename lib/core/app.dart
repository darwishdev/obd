import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/routes/app_router.dart';
import 'package:obd/theme/themes.dart';
import 'package:obd/utils/extensions.dart';
import 'package:responsive_framework/responsive_framework.dart';

final appRouterProvider = Provider<AppRouter>((ref) => AppRouter());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final router = ref.read(appRouterProvider);
      return MaterialApp.router(
        title: "ODB",
        themeMode: ThemeMode.dark,
        builder: EasyLoading.init(
          builder: (context, navigator) {
            // Update scale for text
            final scale = context.mediaQuery.textScaleFactor.clamp(0.8, 1.0);

            return Builder(
              builder: (context) {
                return ResponsiveBreakpoints.builder(
                  child: MediaQuery(
                    data: context.mediaQuery.copyWith(textScaleFactor: scale),
                    child: Theme(
                      data: getThemeData(context),
                      child: navigator!,
                    ),
                  ),
                  breakpoints: [
                    const Breakpoint(start: 0, end: 450, name: MOBILE),
                    const Breakpoint(start: 451, end: 800, name: TABLET),
                    const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  ],
                );
              },
            );
          },
        ),
        routerConfig: router.config(),
      );
    });
  }
}
