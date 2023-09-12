import 'package:dio/dio.dart';
import 'package:flutter_base_project/data/response_model/response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_v1.g.dart';

@RestApi()
abstract class ApiV1 {
  factory ApiV1(Dio dio, {String baseUrl}) = _ApiV1;

  @POST('/account/v2/otp/verify-email-otp')
  Future<ResponseModel> verifyEmailOTP(@Body() Map<String, String> requestBody);

  @POST('/api-portal/api/v1/auth/refresh-token')
  Future<ResponseModel> refreshAccessToken(
      {@Body() required String refreshToken});

  @GET('/v4/anime?q={placement}')
  Future<ResponseModel> getFacts(
      {@Path('placement') required String placement});
}
