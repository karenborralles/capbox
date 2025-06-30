import 'package:dio/dio.dart';
import '../dtos/login_request_dto.dart';

class AuthApiClient {
  final Dio _dio;

  AuthApiClient(this._dio);

  Future<Map<String, dynamic>> login(LoginRequestDto dto) async {
    final response = await _dio.post('/login', data: dto.toJson());
    return response.data;
  }
}