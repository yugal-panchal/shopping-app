import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seek_assesment/controllers/shopping_controller.dart';
import 'package:seek_assesment/views/widgets/product_card.dart';

class ExploreProducts extends StatelessWidget {
  final ShoppingController shopController = Get.put(ShoppingController());
  ExploreProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetX<ShoppingController>(builder: (controller) {
        return controller.products.isEmpty ? const CircularProgressIndicator(color: Colors.black,) : ProductCard(product: controller.products.first);
      }),
    );
  }
}
