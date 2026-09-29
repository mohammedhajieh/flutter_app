import 'dart:developer';

import 'package:first_app/regex/app_regex.dart';
import 'package:first_app/routes/app_pages.dart';
import 'package:first_app/utils/widgets/appbar/main_app_bar.dart';
import 'package:first_app/utils/widgets/textfield/main_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHide = true;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void changeIsHide() {
    setState(() {
      isHide = !isHide;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Login'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 70),
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/9118/9118813.png',
                    ),
                  ),
                  SizedBox(height: 30),
                  MainTextField(
                    prefixIcon: Icon(Icons.email, size: 30, color: Colors.grey),
                    controller: emailController,
                    validator: (email) {
                      if (email?.isEmpty ?? true) {
                        return 'Email is required.';
                      }
                      if (!AppRegex.emailRegex.hasMatch(email!)) {
                        return 'Invalid email. Hint: email@example.com';
                      }
                      return null;
                    },
                    labelText: 'Email',
                  ),
                  SizedBox(height: 30),
                  MainTextField(
                    prefixIcon: Icon(Icons.lock, size: 30, color: Colors.grey),
                    obscureText: true,
                    controller: passwordController,
                    validator: (password) {
                      if (password?.isEmpty ?? true) {
                        return 'Password is required.';
                      }
                      // else if (!password!.contains(AppRegex.passwordRegex)) {
                      //   return 'Password must be at least 8 characters, with uppercase, lowercase, number, and symbol.';
                      // }
                      return null;
                    },
                    labelText: 'Password',
                  ),
                  SizedBox(height: 50),
                  Text('Email: $email'),

                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 60),
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String email = '';
  void onPressed() {
    formKey.currentState?.save();

    if (formKey.currentState?.validate() ?? false) {
      log(passwordController.text);
      log(email);
      Navigator.of(context).pushNamed(
        AppPages.productScreen,
        arguments: {
          'email': emailController.text,
          'password': passwordController.text,
        },
      );
    }
  }
}
