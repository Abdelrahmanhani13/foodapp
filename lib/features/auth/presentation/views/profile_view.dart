import 'package:flutter/material.dart';
import 'package:foodapp/core/utils/app_colors.dart';
import 'package:foodapp/core/utils/app_router.dart';
import 'package:foodapp/core/utils/text_style.dart';
import 'package:foodapp/features/auth/presentation/widgets/custom_user_data.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),

              /// PROFILE IMAGE
              Center(
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: AppColors.primary,
                  child: const CircleAvatar(
                    radius: 52,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              /// DATA (READ ONLY)
              buildInfoTile(Icons.person, "Full Name", "John Doe"),
              buildInfoTile(Icons.email, "Email", "john@email.com"),
              buildInfoTile(Icons.phone, "Phone", "+20123456789"),

              const Spacer(),

              /// BUTTONS
              Row(
                children: [
                  /// EDIT BUTTON ✅
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        context.go(AppRouter.editUserData);
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Edit Profile",
                        style: TextStyles.bold16.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  /// LOGOUT BUTTON ✅
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print("Logout");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Log Out",
                        style: TextStyles.bold16.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
