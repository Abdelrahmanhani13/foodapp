  import 'package:flutter/material.dart';
import 'package:foodapp/core/utils/app_colors.dart';

Widget topping(String name, bool selected) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? AppColors.primary : Colors.grey[300]!,
            ),
          ),
          child: Icon(
            selected ? Icons.check : Icons.add,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontSize: 12)),
      ],
    );
  }