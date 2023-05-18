import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weatha/core/utils/app_utils.dart';

import '../const/app_values.dart';

class DioHelper {
  Dio? _dioInstance;

  Dio? get dio {
    _dioInstance ??= initDio();
    return _dioInstance;
  }

  Dio initDio() {
    final Dio dio = Dio(BaseOptions(
      baseUrl: AppValues.baseUrl,
      headers: <String, dynamic>{},
      connectTimeout: const Duration(minutes: 2),
      receiveTimeout: const Duration(minutes: 2),
    ));

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          request: true,
          responseBody: true,
          responseHeader: true,
          compact: true,
          maxWidth: 120,
        ),
      );
    }
    return dio;
  }

  void update() => _dioInstance = initDio();

  Future<Response> get(
    String url, {
    Map<String, dynamic>? header,
    Map<String, dynamic>? json,
  }) async {
    return await dio!
        .get(url, queryParameters: json, options: Options(headers: header))
        .then((response) {
      return response;
    }).catchError(
      (error) {
        AppUtils.errorToast(
            code: error.response?.statusCode?.toString() ?? "error",
            msg: error.response?.data?.toString() ?? "error ");
      },
    );
  }

  Future<Response> post(
    String url, {
    Map<String, dynamic>? header,
    dynamic data,
  }) async {
    return await dio!
        .post(url, data: data, options: Options(headers: header))
        .then((response) {
      return response;
    }).catchError(
      (error) {
        AppUtils.errorToast(
            code: error.response?.statusCode?.toString() ?? "error",
            msg: error.response?.data?.toString() ?? "error ");
      },
    );
  }

  Future<Response> put(
    String url, {
    Map<String, dynamic>? header,
    dynamic data,
  }) async {
    return await dio!
        .put(url, data: data, options: Options(headers: header))
        .then((response) {
      return response;
    }).catchError(
      (error) {
        AppUtils.errorToast(
            code: error.response?.statusCode?.toString() ?? "error",
            msg: error.response?.data?.toString() ?? "error ");
      },
    );
  }

  Future<Response> delete(
    String url, {
    Map<String, dynamic>? header,
    dynamic data,
  }) async {
    return await dio!
        .delete(url, data: data, options: Options(headers: header))
        .then((response) {
      return response;
    }).catchError(
      (error) {
        AppUtils.errorToast(
            code: error.response?.statusCode?.toString() ?? "error",
            msg: error.response?.data?.toString() ?? "error ");
      },
    );
  }
}
