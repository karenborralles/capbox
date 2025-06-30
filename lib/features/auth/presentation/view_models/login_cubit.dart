import 'package:capbox/features/auth/domain/use_cases/login_user_usecase.dart';
import 'package:flutter/material.dart';

class LoginCubit extends ChangeNotifier {
  final LoginUserUseCase _loginUserUseCase;

  LoginCubit(this._loginUserUseCase);

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final user = await _loginUserUseCase(email: email, password: password);
      print('Usuario autenticado: ${user.name}');
    } catch (e) {
      _errorMessage = 'Error de autenticación';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}