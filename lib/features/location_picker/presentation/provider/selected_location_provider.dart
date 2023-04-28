import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/features/location_picker/data/location_model.dart';

final selectedLocationProvider =
    StateProvider.autoDispose<LocationModel?>((ref) => null);
