import 'package:flutter/material.dart';
import 'package:foodapp/core/utils/app_colors.dart';
import 'package:foodapp/features/auth/presentation/views/profile_view.dart';
import 'package:foodapp/features/cart/presentation/views/cart_view.dart';
import 'package:foodapp/features/home/presentation/views/home_view.dart';
import 'package:foodapp/features/order_history/presentation/views/order_history.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeView(),
    const CartView(),
    const OrderHistory(),
    const ProfileView(),
  ];

  final List<String> labels = ['Home', 'Cart', 'Orders', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 60, // حجم صغير ومظبوط جدًا
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            final bool isActive = currentIndex == index;
            return GestureDetector(
              onTap: () => setState(() => currentIndex = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // الأيقونة
                    Icon(
                      [
                        Icons.home_rounded,
                        Icons.shopping_bag_rounded,
                        Icons.receipt_long_rounded,
                        Icons.person_rounded,
                      ][index],
                      size: 26,
                      color: isActive ? AppColors.primary : Colors.grey[600],
                    ),

                    const SizedBox(height: 6),

                    // النص (يظهر فقط للصفحة المختارة)
                    AnimatedOpacity(
                      opacity: isActive ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 250),
                      child: Text(
                        labels[index],
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: isActive ? AppColors.primary : Colors.transparent,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}