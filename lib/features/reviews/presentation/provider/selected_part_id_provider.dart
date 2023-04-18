import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedPartIDProvider =
    StateProvider.autoDispose<String?>((ref) => null);
