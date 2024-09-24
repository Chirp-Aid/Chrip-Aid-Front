import 'package:chrip_aid/auth/dto/login_request_dto.dart';
import 'package:chrip_aid/auth/dto/signup_request_dto.dart';
import 'package:chrip_aid/auth/model/repository/auth_repository.stub.dart';
import 'package:chrip_aid/common/dio/dio.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

part 'auth_repository.g.dart';

final authRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
//  return AuthRepositoryStub();
  return AuthRepository(dio);
});

@RestApi()
abstract class AuthRepository {
  factory AuthRepository(Dio dio, {String? baseUrl}) = _AuthRepository;

  @POST('/auth/authorityType')
  Future login(@Body() LoginRequestDto loginRequestDto);

  @POST('/members/new/authorityType')
  Future signup(@Body() SignupRequestDto signupRequestDto);

  @POST('/auth/authorityType/fcm')
  @Headers({'accessToken' : 'true'})
  Future saveToken(@Header('fcm-token') String fcmToken);
}
