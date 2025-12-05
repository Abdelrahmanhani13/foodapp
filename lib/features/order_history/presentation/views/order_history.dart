import 'package:flutter/material.dart';
import 'package:foodapp/features/order_history/presentation/widgets/order_card.dart';
import 'package:go_router/go_router.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FFED),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          "Order History",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 140), // 140 عشان الـ BottomNavBar ما يغطيش
        itemCount: 10,
        itemBuilder: (context, index) {
          return orderCard(
            orderId: "#123456789",
            date: "01/01/2023",
            itemsCount: 2,
            total: 50.0,
            status: "Delivered",
          );
        },
        
        
      ),
      
    );
  }

  
}