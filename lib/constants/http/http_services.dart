import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import 'logging_interceptor.dart';

class APIService {
  var _dio;
  var _dioCacheOption;

  APIService() {
    BaseOptions options =
        BaseOptions(receiveTimeout: 10000, connectTimeout: 10000);
    _dio = Dio(options);

    _dioCacheOption = CacheOptions(
      store: MemCacheStore(maxSize: 10485760, maxEntrySize: 1048576),
      policy: CachePolicy.forceCache,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7),
      priority: CachePriority.normal,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );



    // LOG HERE
    _dio.interceptors.add(LoggingInterceptor());

    //CACHE HERE
    _dio.interceptors.add(DioCacheInterceptor(options: _dioCacheOption));
  }

  Future<dynamic> get(String url) async {
    Response response;
    try {
      response = await _dio.get(url,
          options: _dioCacheOption.copyWith(policy: CachePolicy.forceCache).toOptions(),);
      return response;
    } on DioError catch (error) {
      // print("Exception occured: $error stackTrace: $stacktrace");
      // return _handleError(error);
      String er = _handleError(error);
      log(er);
      throw Exception(er);
    }
  }

  Future post(String url, var body) async {
    // print(Hive.box('user').get('token'));
    try {
      Response response = await _dio.post(
        url,
        data: body,
      );
      return response;
    } on DioError catch (error) {
      if (error is DioError) {
        String er = _handleError(error);
        log(er);
        throw Exception(er);
      }
    }
  }

  String _handleError(DioError error) {
    String errorDescription = "";
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.other:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          errorDescription =
              "Received invalid status code: ${error.response?.statusCode}";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }
}
