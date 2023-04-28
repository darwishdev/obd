import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/features/centers/data/models/center_model.dart';
import 'package:obd/features/centers/data/models/winch_model.dart';
import 'package:obd/features/centers/domain/usecases/centers.dart';
import 'package:obd/features/centers/domain/usecases/winches.dart';
import 'package:obd/services/dio_client.dart';
import 'package:obd/utils/endpoints.dart';

abstract class CenterRemoteDataSource {
  Future<List<WinchModel>> winches(WinchesParams params);
  Future<List<CenterModel>> centers(CentersParams params);
}

final centerRemoteDataSourceImpl = Provider<CenterRemoteDataSourceImpl>(
  (ref) => CenterRemoteDataSourceImpl(ref.watch(dioClientProvider)),
);

class CenterRemoteDataSourceImpl implements CenterRemoteDataSource {
  final DioClient _dioClient;

  CenterRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<WinchModel>> winches(WinchesParams params) async {
    final response = await _dioClient.dio.post(
      EndPoints.winches,
      data: {
        "lat": 1,
        "long": 1,
      },
    );
    final winches = <WinchModel>[];
    for (final winch in response.data['winches']) {
      winches.add(WinchModel.fromJson(winch));
    }
    return winches;
  }

  @override
  Future<List<CenterModel>> centers(CentersParams params) async {
    final response = await _dioClient.dio.post(
      EndPoints.centers,
      data: {
        "lat": params.lat,
        "long": params.long,
      },
    );
    final centers = <CenterModel>[];
    for (final center in response.data['centers']) {
      centers.add(CenterModel.fromJson(center));
    }
    return centers;
  }
}
