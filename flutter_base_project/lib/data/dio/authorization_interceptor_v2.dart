import 'package:dio/dio.dart';
import 'package:flutter_base_project/data/response_model/response_model.dart';
import 'dio_util.dart';

class AuthorizationInterceptorV2 extends QueuedInterceptor {
  static const Map<String, bool> _authorizationIgnoredSuffixes = {
    // MARK: Phone.
    '/auth/ ': true,
    '/auth/register-by-phone': true,
    '/auth/reset-phone-password': true,
    '/api/v1/auth/verify-login-phone': true,
    '/auth/login-by-phone': true,
    '/agency/api/onboarding/self-register': true,
    '/agency/api/public/app/invitation-code-check': true,
    // MARK: Email.
    '/auth/send-otp': true,
    '/auth/verify-otp': true,
    '/auth/register': true,
    '/auth/reset-password': true,
    '/api-portal/api/v1/auth/verify-login-email': true,
    '/api-portal/api/v1/auth/login': true,
    '/account/otp/send-phone-otp': true,
    '/account/otp/verify-phone-otp': true,
    '/api-portal/api/v1/auth/send-otp-to-phone': true,
  };

  String refreshTokenPath = '/api/v1/auth/refresh-token';

  static bool _isAuthorizationIgnoredSuffix(String suffix) =>
      _authorizationIgnoredSuffixes[suffix] ?? false;

  static bool _isAuthorizationRequiredSuffix(String suffix) =>
      !(_isAuthorizationIgnoredSuffix(suffix));

  String? accessToken;
  String? refreshToken;
  final String userAgent;

  AuthorizationInterceptorV2(
      {required this.userAgent, this.accessToken, this.refreshToken});

  void updateCredential(String? accessToken, String? refreshToken) {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_isAuthorizationRequiredSuffix(options.path)) {
      options.headers['Authorization'] = 'Bearer ${accessToken ?? ''}';
    }
    options.headers['lang'] = 'vi';
    options.headers['User-Agent'] = userAgent;
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      String expiredAccessToken = err.requestOptions.headers['Authorization'];
      String currentAccessToken = 'Bearer ${accessToken ?? ''}';
      if (expiredAccessToken != currentAccessToken &&
          (accessToken ?? '').isNotEmpty) {
        Response response = await retryWithNewAccessToken(err);
        return handler.resolve(response);
      }
    }
    if (err.response?.statusCode == 401 && (refreshToken ?? '').isNotEmpty) {
      bool success = await refreshAccessToken();
      if (success) {
        Response response = await retryWithNewAccessToken(err);
        return handler.resolve(response);
      } else {
        accessToken = '';
        refreshToken = '';
        DioUtil.instance.updateAccessToken('', '');
      }
      return handler.next(err);
    }
    return handler.next(err);
  }

  Future<Response> retryWithNewAccessToken(DioException err) async {
    err.requestOptions.headers['Authorization'] = 'Bearer $accessToken';
    Response response = await DioUtil.instance.dio.fetch(err.requestOptions);
    return response;
  }

  Future<bool> refreshAccessToken() async {
    try {
      ResponseModel responseModel = await DioUtil.instance
          .genApiWithoutAuth()
          .refreshAccessToken(refreshToken: refreshToken ?? '');
      String newAccessToken = responseModel.data?['access_token'];
      String newRefreshToken = responseModel.data?['refresh_token'];
      DioUtil.instance.updateAccessToken(newAccessToken, newRefreshToken);
      return true;
    } on DioException catch (_) {
      return false;
    } catch (error) {
      return false;
    }
  }
}
