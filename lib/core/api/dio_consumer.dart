import 'dart:io';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import '../api/app_interceptors.dart';
import '../api/end_points.dart';
import 'api_consumer.dart';
import 'package:dio/dio.dart';
import '../errors/exceptions.dart';
import 'status_codes.dart';
import 'package:flutter_code_notes/injection_container.dart' as di;

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      followRedirects: false,
      validateStatus: (status) {
        return status! < StatusCodes.internalServerError;
      },
    );

    client.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }

  @override
  Future get(
      {required String path, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(
      {required String path,
      required Map<String, dynamic> body,
      bool formDataEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.post(path,
          data: formDataEnabled ? FormData.fromMap(body) : body,
          queryParameters: queryParameters);
      return response.data;
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(
      {required String path,
      required Map<String, dynamic> body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await client.post(path, data: body, queryParameters: queryParameters);
      return response.data;
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionError:
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCodes.unauthorized:
          case StatusCodes.forbidden:
            throw const UnauthorizedException();
          case StatusCodes.notFound:
            throw const NotFoundException();
          case StatusCodes.conflict:
            throw const ConflictException();

          case StatusCodes.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.badCertificate:
      // TODO: Handle this case.
      break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.unknown:
        throw const NoInternetConnectionException();
    }
  }
}