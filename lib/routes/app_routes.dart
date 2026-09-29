import 'package:first_app/login/view/login_screen.dart';
import 'package:first_app/product/view/product_screen.dart';
import 'package:first_app/product_details/view/product_details_screen.dart';
import 'package:first_app/routes/app_pages.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPages.loginScreen:
        return MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        );

      case AppPages.productScreen:
        return MaterialPageRoute(
          builder: (context) {
            final arguments = settings.arguments as Map<String, dynamic>;
            final email = arguments['email'];
            final password = arguments['password'];
            return ProductScreen(email: email, password: password);
          },
        );

      case AppPages.productDetailsScreen:
        return MaterialPageRoute(
          builder: (context) {
            return ProductDetailsScreen();
          },
        );
    }
    return null;
  }
}
