import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/features/home/data/models/obd_model.dart';
import 'package:obd/features/sessions/presentation/provider/session_attach_value_provider.dart';
import 'package:odb_connect/odb_connect.dart';

final obdInfoProvider = FutureProvider.autoDispose<OBDModel?>((ref) {
  final timer = Timer(const Duration(seconds: 5), () => ref.invalidateSelf());
  ref.onDispose(timer.cancel);
  return ref.watch(obdReaderProvider).fetchOBDInfo().then((val) {
    if (val != null) {
      ref.read(sessionAttachValueProvider.notifier).sessionAttachValue(val);
    }
    print('obdInfoProvider::::: $val');
    return val;
  });
});

final obdReaderProvider = ChangeNotifierProvider((ref) => ObdReader());

class ObdReader with ChangeNotifier {
  String? obdMesg;
  bool started = false;

  reset() {
    started = false;
    notifyListeners();
  }

  Future<void> startOBD() async {
    try {
      obdMesg = await OdbConnect.startOBD;
      started = true;
    } on PlatformException {
      obdMesg = 'Failed to start obdMesg.';
      started = false;
    }
    print('OBD Mesg: $obdMesg');
    notifyListeners();
  }

  Future<OBDModel?> fetchOBDInfo() async {
    try {
      final results = await Future.wait([
        OdbConnect.getSpeed,
        OdbConnect.getRPM,
        OdbConnect.getAirIntakeTemperature,
        OdbConnect.getEngineLoad,
        OdbConnect.getModuleVoltage,
      ]);
      final obdModel = OBDModel(
        speed: results[0],
        rpm: results[1],
        airIntakeTemp: results[2],
        engineLoad: results[3],
        moduleVoltage: results[4],
      );
      print('fetchOBDInfo::::: ${obdModel.toJson()}');
      return obdModel;
    } catch (e) {
      print('Error FetchOBDInfo: $e');
      return null;
    }
  }

  Future<List<String>?> fetchTroubleCode() async {
    try {
      final results = await Future.wait([
        OdbConnect.getTroubleCode,
        OdbConnect.getPermanentTroubleCode,
        OdbConnect.getPendingTroubleCode,
      ]);
      print('fetchTroubleCode::::: $results');
      return results;
    } catch (e) {
      print('Error FetchTroubleCode: $e');
      return null;
    }
  }
}

// void _notNeeded() {
// final tripRecord = await OdbConnect.tripRecord;
// final airFuelRatio = await OdbConnect.getAirFuelRatio;
// final fuelPressure = await OdbConnect.getFuelPressure;
// final oilTemperature = await OdbConnect.getOilTemperature;
// final engineRuntime = await OdbConnect.getEngineRuntime;
// final timingAdvance = await OdbConnect.getTimingAdvance;
// }

// result {speed: 0, rpm: 0, airIntakeTemp: ٧٦C, troubleCode: , permanentTroubleCode: , pendingTroubleCode: , engineLoad: ٠٫٠%, moduleVoltage: ١٢٫٠V}
// result {speed: 0, rpm: 796, airIntakeTemp: ٧٧C, troubleCode: , permanentTroubleCode: , pendingTroubleCode: , engineLoad: ٣٣٫٧%, moduleVoltage: ١٣٫٠V}
// result {speed: 0, rpm: 742, airIntakeTemp: ٨١C, troubleCode: , permanentTroubleCode: , pendingTroubleCode: , engineLoad: ٣١٫٨%, moduleVoltage: ١٣٫٠V}
