import 'package:flutter/material.dart';
import 'package:foodapp/core/utils/app_colors.dart';

Widget orderCard({
    required String orderId,
    required String date,
    required int itemsCount,
    required double total,
    required String status,
  }) {
    final bool isDelivered = status == "Delivered";
    final bool isCancelled = status == "Cancelled";

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order ID + Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderId,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: isDelivered
                      ? AppColors.primary.withOpacity(0.15)
                      : isCancelled
                          ? Colors.red.withOpacity(0.15)
                          : Colors.orange.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: isDelivered
                        ? AppColors.primary
                        : isCancelled
                            ? Colors.red
                            : Colors.orange[700],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Date + Items
          Row(
            children: [
              Icon(Icons.access_time, size: 18, color: Colors.grey[600]),
              const SizedBox(width: 6),
              Text(
                date,
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),
              const Spacer(),
              Icon(Icons.fastfood, size: 18, color: Colors.grey[600]),
              const SizedBox(width: 6),
              Text(
                "$itemsCount items",
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Total + Reorder Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: \$${total.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF006400),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 6,
                ),
                child: const Text(
                  "Reorder",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }