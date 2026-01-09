import 'package:flutter/material.dart';
import 'package:markety/config/route_generator.dart';
import 'package:markety/config/routes.dart';
import 'package:markety/core/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.signInRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.kWhiteColor),
    );
  }
}
