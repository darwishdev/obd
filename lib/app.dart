// import 'package:authentication_repository/authentication_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:obd/authentication/authentication.dart';
// import 'package:obd/login/login.dart';
// import 'package:obd/splash/splash.dart';
// import 'package:user_repository/user_repository.dart';
//
// class App extends StatelessWidget {
//   const App({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider.value(
//       value: authenticationRepository,
//       child: BlocProvider(
//         create: (_) => AuthenticationBloc(
//           authenticationRepository: authenticationRepository,
//           userRepository: userRepository,
//         ),
//         child: const AppView(),
//       ),
//     );
//   }
// }
//
// class AppView extends StatefulWidget {
//   const AppView({super.key});
//
//   @override
//   State<AppView> createState() => _AppViewState();
// }
//
// class _AppViewState extends State<AppView> {
//   final _navigatorKey = GlobalKey<NavigatorState>();
//
//   NavigatorState get _navigator => _navigatorKey.currentState!;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       navigatorKey: _navigatorKey,
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//         textTheme: const TextTheme(
//           headline1: TextStyle(
//               fontSize: 18.0,
//               fontFamily: 'English',
//               color: Colors.white,
//               fontWeight: FontWeight.bold),
//           headline2: TextStyle(
//               fontSize: 16.0,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontFamily: 'English'),
//           bodyText1: TextStyle(
//               fontSize: 16.0, color: Colors.white, fontFamily: 'English'),
//           bodyText2: TextStyle(
//               fontSize: 14.0,
//               color: Color.fromARGB(255, 161, 161, 161),
//               fontFamily: 'English'),
//         ),
//         scaffoldBackgroundColor: Colors.black,
//         bottomNavigationBarTheme:
//             BottomNavigationBarThemeData(backgroundColor: Colors.black),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//             style: ButtonStyle(
//                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                         side: BorderSide(color: Colors.transparent))),
//                 backgroundColor: MaterialStateProperty.resolveWith((states) {
//                   // If the button is pressed, return green, otherwise blue
//                   if (states.contains(MaterialState.pressed)) {
//                     return Colors.green;
//                   }
//                   return Colors.transparent;
//                 }),
//                 textStyle: MaterialStateProperty.resolveWith((states) {
//                   // If the button is pressed, return size 40, otherwise 20
//                   if (states.contains(MaterialState.pressed)) {
//                     return TextStyle(fontSize: 40, color: Colors.white);
//                   }
//                   return TextStyle(fontSize: 20, color: Colors.white);
//                 }),
//                 minimumSize:
//                     MaterialStateProperty.all(Size(double.infinity, 40)))),
//         inputDecorationTheme: InputDecorationTheme(
//           border: OutlineInputBorder(
//             borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//             borderSide: BorderSide(color: const Color(0xFF2c2c2c), width: 1.0),
//           ),
//           labelStyle: TextStyle(fontSize: 24.0),
//         ),
//         primarySwatch: Colors.grey,
//         primaryColor: Colors.black,
//         backgroundColor: const Color(0xFF000000),
//         dividerColor: Color.fromARGB(78, 255, 255, 255),
//         /* dark theme settings */
//       ),
//       themeMode: ThemeMode.dark,
//       builder: (context, child) {
//         return BlocListener<AuthenticationBloc, AuthenticationState>(
//           listener: (context, state) {
//             switch (state.status) {
//               case AuthenticationStatus.authenticated:
//                 // _navigator.pushAndRemoveUntil<void>(
//                 //   HomePage.route(),
//                 //   (route) => false,
//                 // );
//                 break;
//               case AuthenticationStatus.unauthenticated:
//                 _navigator.pushAndRemoveUntil<void>(
//                   LoginPage.route(),
//                   (route) => false,
//                 );
//                 break;
//               case AuthenticationStatus.unknown:
//                 break;
//             }
//           },
//           child: child,
//         );
//       },
//       onGenerateRoute: (_) => SplashPage.route(),
//     );
//   }
// }
