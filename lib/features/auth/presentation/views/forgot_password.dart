import 'package:flutter/material.dart';
import 'package:foodapp/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FFED),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF006400)),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          "Forgot Password",
          style: TextStyle(
            color: Color(0xFF006400),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // أيقونة بسيطة
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF006400).withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.lock_outline,
                size: 60,
                color: Color(0xFF006400),
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              "Enter your email address and we'll send you a link to reset your password.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 40),

            // حقل الإيميل
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email Address",
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Color(0xFF006400),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFF006400),
                    width: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // زر إرسال
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // هنا هترسل الإيميل
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Reset link sent to your email!"),
                      backgroundColor: Color(0xFF006400),
                    ),
                  );
                  context.pop(); // أو context.go('/login')
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006400),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "Send Reset Link",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const Spacer(),

            TextButton(
              onPressed: () => context.go(AppRouter.login),
              child: const Text(
                "Back to Login",
                style: TextStyle(
                  color: Color(0xFF006400),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
