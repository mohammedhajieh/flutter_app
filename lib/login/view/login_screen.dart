import 'package:first_app/login/view/widget/login_view.dart';
import 'package:first_app/login/view_model/cubit.dart';
import 'package:first_app/utils/widgets/appbar/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: MainAppBar(title: 'Login'),
        body: LoginView(),
      ),
    );
  }
}
