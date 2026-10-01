import 'package:first_app/features/login/view_model/state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(LoginLoadingState());
      await Future.delayed(Duration(seconds: 2));
      if (emailController.text == 'test@gmail.com') {
        emit(
          LoginSuccessState(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
      } else {
        emit(LoginErrorState(errorMessage: 'User Not Found'));
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
