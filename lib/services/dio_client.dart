import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/utils/constants.dart';

final dioClientProvider = ChangeNotifierProvider<DioClient>(
  (ref) {
    return DioClient();
  },
);

class DioClient with ChangeNotifier {
  final Dio _dio;
  Dio get dio => _dio;

  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: AppConstants.kBaseUrl,
            receiveTimeout: const Duration(seconds: 30),
            connectTimeout: const Duration(seconds: 30),
            sendTimeout: const Duration(seconds: 30),
            contentType: 'application/json',
          ),
        )..interceptors.add(AppInterceptors());
}

class AppInterceptors extends Interceptor {
  AppInterceptors();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
