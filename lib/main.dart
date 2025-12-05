import 'package:flutter/material.dart';
import 'package:foodapp/core/utils/app_colors.dart';
import 'package:foodapp/features/auth/presentation/views/login_view.dart';
import 'package:foodapp/features/auth/presentation/views/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
      ),
      title: 'Food App',
      home: ProfileView(),
    );
  }
}
