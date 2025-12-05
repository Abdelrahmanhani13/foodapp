import 'package:flutter/material.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
        backgroundColor: const Color(0xFF006400),
      ),
      body: const Center(
        child: Text('This is the Order History View'),
      ),
    );
  }
}