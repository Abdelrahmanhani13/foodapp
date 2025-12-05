import 'package:flutter/material.dart';
import 'package:foodapp/core/utils/app_colors.dart';

Widget categoryChip(String title, bool active) {
  return Padding(
    padding: const EdgeInsets.only(right: 12),
    child: Chip(
      label: Text(
        title,
        style: TextStyle(
          color: active ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: active ? AppColors.primary : Colors.grey[200],
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
  );
}
