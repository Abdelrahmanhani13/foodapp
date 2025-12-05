import 'package:flutter/material.dart';
import 'package:foodapp/core/utils/app_colors.dart';
import 'package:foodapp/features/product/presentation/widgets/custom_button.dart';
import 'package:foodapp/features/product/presentation/widgets/custom_toppings.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ✅ Burger Image
            Center(
              child: Image.network(
                "https://images.pexels.com/photos/327158/pexels-photo-327158.jpeg",
                height: 300,
                fit: BoxFit.cover,
              ),
            ),

            // ✅ FIXED OVERFLOW HERE
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF8FFED),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Customize Your Burger",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "to Your Tastes. Ultimate Experience",
                      style: TextStyle(color: Colors.grey[700]),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Spicy",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Slider(
                      value: 0.6,
                      onChanged: (_) {},
                      activeColor: AppColors.primary,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Toppings",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        topping("Tomato", true),
                        topping("Onion", true),
                        topping("Pickles", false),
                        topping("Bacon", true),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Side options",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        topping("Fries", true),
                        topping("Coleslaw", false),
                        topping("Salad", false),
                        topping("Onion", false),
                      ],
                    ),

                    const Spacer(),

                    CustomButton(title: 'Add to Cart', text: 'Total\n\$18.19',),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}

