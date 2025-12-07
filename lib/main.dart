import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/core/network/api_client.dart';
import 'package:foodapp/core/network/api_service.dart';
import 'package:foodapp/core/utils/app_colors.dart';
import 'package:foodapp/core/utils/app_router.dart';
import 'package:foodapp/features/auth/data/auth_repo.dart';
import 'package:foodapp/features/auth/presentation/logic/auth_cubit/authentication_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticationCubit(AuthRepo(ApiService(ApiClient()))),
        ),
      ],
      child: MaterialApp.router(
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
        routerConfig: AppRouter.router,
      ),
    );
  }
}
