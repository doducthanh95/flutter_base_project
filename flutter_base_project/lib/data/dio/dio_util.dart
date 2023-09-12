import 'package:dio/dio.dart';
import 'package:flutter_base_project/data/dio/api_v1.dart';
import 'package:flutter_base_project/data/dio/authorization_interceptor_v2.dart';
import 'package:flutter_base_project/utils/config/app_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioUtil {
  Dio get dio => _dio;
  ApiV1 get apiV1 => _getApi();

  late Dio _dio;
  late AuthorizationInterceptorV2 _authorizationInterceptor;
  late PrettyDioLogger _dioLogger;
  String? _accessToken;
  String? _refreshToken;

  DioUtil._();

  static DioUtil get instance => _instance;
  static final DioUtil _instance = DioUtil._();

  ApiV1 _getApi() {
    Dio dio = _genDio();
    return ApiV1(dio, baseUrl: AppConfig.instance.domain);
  }

  Dio _genDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.instance.domain,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    _authorizationInterceptor.updateCredential(_accessToken, _refreshToken);
    dio.interceptors.add(_authorizationInterceptor);
    dio.interceptors.add(AppConfig.instance.alice.getDioInterceptor());
    dio.interceptors.add(_dioLogger);
    return dio;
  }

  ApiV1 genApiWithoutAuth() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.instance.domain,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    _dioLogger = PrettyDioLogger();
    dio.interceptors.add(AppConfig.instance.alice.getDioInterceptor());
    dio.interceptors.add(_dioLogger);
    return ApiV1(dio, baseUrl: AppConfig.instance.domain);
  }

  Future initDio(
      String userAgent, String? accessToken, String? refreshToken) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _authorizationInterceptor = AuthorizationInterceptorV2(
        userAgent: userAgent,
        accessToken: accessToken,
        refreshToken: refreshToken);
    _dioLogger = PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 180);
    _dio = _genDio();
  }

  void updateAccessToken(String? accessToken, String? refreshToken) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }
}
