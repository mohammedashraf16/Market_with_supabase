import 'package:flutter/material.dart';
import 'package:markety/config/route_generator.dart';
import 'package:markety/config/routes.dart';
import 'package:markety/core/utils/app_colors.dart';
import 'package:markety/core/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: Constants.projectUrl,
    anonKey: Constants.anonKey,
  );
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
      theme: ThemeData(scaffoldBackgroundColor: AppColors.kScaffoldColor),
    );
  }
}
