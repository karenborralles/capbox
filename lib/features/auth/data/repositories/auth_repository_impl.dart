import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_api_client.dart';
import '../dtos/login_request_dto.dart';
import '../mappers/user_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiClient _apiClient;

  AuthRepositoryImpl(this._apiClient);

  @override
  Future<User> login({required String email, required String password}) async {
    final dto = LoginRequestDto(email: email, password: password);
    final data = await _apiClient.login(dto);
    return UserMapper.fromJson(data);
  }
}