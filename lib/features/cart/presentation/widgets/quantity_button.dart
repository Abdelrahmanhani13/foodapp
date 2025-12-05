import 'package:flutter/material.dart';
import 'package:foodapp/core/utils/app_colors.dart';

Widget quantityButton(IconData icon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary.withOpacity(0.1),
      ),
      child: Icon(icon, color: AppColors.primary, size: 28),
    ),
  );
}
