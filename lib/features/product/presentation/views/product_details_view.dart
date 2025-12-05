import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: const Color(0xFF006400),
      ),
      body: const Center(
        child: Text('This is the Product Details View'),
      ),
    );
  }
}