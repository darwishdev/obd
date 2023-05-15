import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/app.dart';
import 'package:obd/core/repositories/token_repository.dart';
import 'package:obd/routes/app_router.dart';
import 'package:obd/routes/app_router.gr.dart';
import 'package:obd/utils/constants.dart';

final dioClientProvider = ChangeNotifierProvider<DioClient>(
  (ref) {
    return DioClient(
      ref.read(tokenRepositoryProvider),
      ref.read(appRouterProvider),
    );
  },
);

class DioClient with ChangeNotifier {
  final Dio _dio;
  Dio get dio => _dio;

  DioClient(TokenRepository repositoryToken, AppRouter appRouter)
      : _dio = Dio(
          BaseOptions(
            baseUrl: AppConstants.kBaseUrl,
            receiveTimeout: const Duration(seconds: 30),
            connectTimeout: const Duration(seconds: 30),
            sendTimeout: const Duration(seconds: 30),
          ),
        )..interceptors.add(AppInterceptors(repositoryToken, appRouter));
}

class AppInterceptors extends Interceptor {
  final TokenRepository _repositoryToken;
  final AppRouter _appRouter;

  AppInterceptors(this._repositoryToken, this._appRouter);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = _repositoryToken.authToken;
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      _repositoryToken.deleteUserAccess();
      _appRouter.replaceAll([const LoginRoute()]);
    }
    return handler.next(err);
  }
}
