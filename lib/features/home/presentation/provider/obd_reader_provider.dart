import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/features/home/data/models/obd_model.dart';
import 'package:obd/features/sessions/presentation/provider/session_attach_value_provider.dart';
import 'package:obd/utils/helper_functions.dart';
import 'package:odb_connect/odb_connect.dart';
import 'package:permission_handler/permission_handler.dart';

final obdInfoProvider = FutureProvider.autoDispose<OBDModel?>((ref) {
  final timer =
      Timer(const Duration(milliseconds: 500), () => ref.invalidateSelf());
  ref.onDispose(timer.cancel);
  return ref.watch(obdReaderProvider).fetchOBDInfo().then((val) {
    if (val != null) {
      ref.read(sessionAttachValueProvider.notifier).sessionAttachValue(val);
    }
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
      var isAccessed = await requestBluetoothAccess();
      if (isAccessed) {
        obdMesg = await OdbConnect.startOBD;
        started = true;
      }
    } catch (e) {
      obdMesg = 'Failed to start obdMesg. $e';
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
        OdbConnect.getOilTemperature,
        OdbConnect.getAirFuelRatio,
        OdbConnect.getFuelPressure,
      ]);
            print('results::::: ${results}');
            // print('fetchOBDInfo::::: ${obdModel.toJson()}');

      final obdModel = OBDModel(
        speed: results[0],
        rpm: results[1],
        airIntakeTemp: results[2],
        engineLoad: results[3],
        moduleVoltage: results[4],
        oilTemp: results[5],
        airFuelRatio: results[6],
        fuelPressure: results[7],
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
      // final results = await Future.wait([
      //   OdbConnect.getTroubleCode,
      //   OdbConnect.getPermanentTroubleCode,
      //   OdbConnect.getPendingTroubleCode,
      // ]);
      final results = await OdbConnect.getTroubleCode;
      print('fetchTroubleCode::::: $results');
      final input = results.replaceAll(RegExp(r"\s+"), "");
      return HelperFunctions.splitByIndex(input, 5);
    } catch (e) {
      print('Error FetchTroubleCode: $e');
      return null;
    }
  }

  Future<int> getAndroidSdk() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.version.sdkInt;
  }

  Future<bool> requestBluetoothAccess() async {
    Future<bool> permStatus;
    if (Platform.isAndroid && await getAndroidSdk() > 30) {
      // It seems some manufacturer misimplement the bluetooth permissions
      // so I have added the request to Permission.bluetooth and inside
      // AndroidManifest.xml I have removed the android:maxSdkVersion="30".
      permStatus = _requestAccess(Permission.bluetooth)
          .then((isGranted) => _requestAccess(Permission.bluetoothScan))
          .then((isGranted) => _requestAccess(Permission.bluetoothConnect))
          .then((isGranted) => _requestAccess(Permission.bluetoothAdvertise))
          .then((isGranted) => isGranted);
    } else {
      permStatus = _requestAccess(Permission.bluetooth);
    }
    return permStatus;
  }

  Future<bool> _requestAccess(Permission permission) async {
    final status = await permission.status;
    if (status.isDenied) {
      return permission.request().isGranted;
    } else {
      return status.isGranted;
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
