import 'package:bloc/bloc.dart';
import 'login_event.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) {
    // Here, you would typically interact with a repository for authentication
    if (email == "test@example.com" && password == "password") {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure("Invalid email or password"));
    }
  }
}
