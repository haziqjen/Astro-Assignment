import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import 'logging_interceptor.dart';

class APIService{

  var _dio;

  APIService() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 10000,
        connectTimeout: 10000
    );
    _dio = Dio(options);
    // LOG HERE
    // _dio.interceptors.add(LoggingInterceptor());

    //CACHE HERE
    _dio.interceptors.add(DioCacheManager(CacheConfig()).interceptor);
  }



  Future<dynamic> get(String url) async {
    Response response;
    try {
      response = await _dio.get(url, options: buildCacheOptions(
        const Duration(days: 7), //duration of cache
        maxStale: const Duration(days: 10),
      ));
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
      Response response = await _dio.post(url,
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