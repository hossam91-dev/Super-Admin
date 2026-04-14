import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    emit(LoginVisibilityChanged(_isPasswordVisible));
  }

  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    await Future.delayed(const Duration(seconds: 2));

    if (email == 'admin@g.com' && password == 'password') {
      emit(LoginSuccess());
    } else {
      emit(LoginError('Invalid credentials'));
    }
  }
}
