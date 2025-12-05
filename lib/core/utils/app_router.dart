import 'package:flutter/material.dart';
import 'package:foodapp/core/utils/app_colors.dart';
import 'package:foodapp/features/auth/presentation/views/edit_user_data.dart';
import 'package:foodapp/features/auth/presentation/views/forgot_password.dart';
import 'package:foodapp/features/auth/presentation/views/login_view.dart';
import 'package:foodapp/features/auth/presentation/views/profile_view.dart';
import 'package:foodapp/features/auth/presentation/views/signup_view.dart';
import 'package:foodapp/features/cart/presentation/views/cart_view.dart';
import 'package:foodapp/features/checkout/presentation/views/checkout_view.dart';
import 'package:foodapp/features/home/presentation/views/home_view.dart';
import 'package:foodapp/features/product/presentation/views/product_details_view.dart';
import 'package:foodapp/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // Route Names
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String productDetails = '/product-details';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String success = '/success';
  static const String profile = '/profile';
  static const String forgotPassword = '/forgotPassword';
  static const String editUserData = '/editUserData';

  // GoRouter Configuration
  static final GoRouter router = GoRouter(
    initialLocation: splash,
    debugLogDiagnostics: true,
    routes: [
      // Splash Screen
      GoRoute(
        path: splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // Login Screen
      GoRoute(
        path: login,
        name: 'login',
        builder: (context, state) => const LoginView(),
      ),

      // Sign Up Screen
      GoRoute(
        path: signup,
        name: 'signup',
        builder: (context, state) => const SignUpView(),
      ),

      // Home Screen
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => const HomeView(),
      ),

      GoRoute(
        path: editUserData,

        name: 'editUserData',
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: forgotPassword,

        name: 'forgotPassword',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: productDetails,
        name: 'productDetails',
        builder: (context, state) {
          return ProductDetailsView();
        },
      ),

      GoRoute(
        path: cart,
        name: 'cart',
        builder: (context, state) => const CartView(),
      ),

      // // Checkout Screen
      GoRoute(
        path: checkout,
        name: 'checkout',
        builder: (context, state) => const CheckoutView(),
      ),

      // // Success Screen
      // GoRoute(
      //   path: success,
      //   name: 'success',
      //   builder: (context, state) => const SuccessScreen(),
      // ),

      // Profile Screen (Example)
      GoRoute(
        path: profile,
        name: 'profile',
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: profile,
        name: 'profile',
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: profile,
        name: 'profile',
        builder: (context, state) => const ProfileView(),
      ),
    ],

    // Error Handler
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 80, color: Colors.red),
            const SizedBox(height: 20),
            Text(
              'Page not found!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go(AppRouter.home),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
