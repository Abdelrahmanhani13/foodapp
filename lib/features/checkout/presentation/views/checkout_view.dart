import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: const Color(0xFF006400),
      ),
      body: const Center(
        child: Text('This is the Checkout View'),
      ),
    );
  }
}