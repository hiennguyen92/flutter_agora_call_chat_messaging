import 'package:flutter_hiennv/models/token.dart';
import 'package:flutter_hiennv/services/auth/authentication_api_service.dart';
import 'package:flutter_hiennv/services/cache/auth_info.dart';
import 'package:flutter_hiennv/services/network/api_callback.dart';
import 'package:flutter_hiennv/services/network/network_service.dart';

class AuthenticationApiServiceImpl extends AuthenticationApiService {
  AuthenticationApiServiceImpl(NetworkService networkService, AuthInfo authInfo) : super(networkService, authInfo);

  @override
  Future<Token?> login(String email, String password, ApiCallback? apiCallback) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Token?> loginWithCustom(Map<String, dynamic> data, ApiCallback? apiCallback) {
    // TODO: implement loginWithCustom
    throw UnimplementedError();
  }

  @override
  Future<Token?> loginWithSocial(String token, String provider, ApiCallback? apiCallback) {
    // TODO: implement loginWithSocial
    throw UnimplementedError();
  }

  @override
  Future<Token?> register(Map<String, dynamic> info, ApiCallback? apiCallback) {
    // TODO: implement register
    throw UnimplementedError();
  }




}
