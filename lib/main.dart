import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/app.dart';

void main() {
  //* Init Riverpod
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
