import 'package:flutter/material.dart';
import 'package:markety/config/router_transitions.dart';
import 'package:markety/config/routes.dart';
import 'package:markety/features/auth/views/login_view.dart';
import 'package:markety/features/auth/views/register_view.dart';
import 'package:markety/features/auth/views/forget_password_view.dart';
import 'package:markety/features/auth/views/reset_new_password_view.dart';
import 'package:markety/features/nav_bar/view/main_layout.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signInRoute:
        return RouterTransitions.build(LoginView());
      case Routes.otpVerificationRoute:
        return RouterTransitions.build(ResetNewPasswordView());
      case Routes.signUpRoute:
        return RouterTransitions.buildScale(RegisterView());
      case Routes.resetPassowrdRoute:
        return RouterTransitions.buildFade(ForgetPasswordView());
      case Routes.mainLayoutRoute:
        return RouterTransitions.buildScale(MainLayout());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
