import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/app.dart';
import 'package:obd/services/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get the instance of shared preferences
  final prefs = await SharedPreferences.getInstance();

  //* Init Riverpod
  runApp(
    ProviderScope(
      overrides: [
        // Override the unimplemented provider with the value gotten from the plugin
        sharedPrefsProvider.overrideWithValue(prefs),
      ],
      child: const App(),
    ),
  );
}
