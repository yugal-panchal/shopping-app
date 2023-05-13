import 'package:flutter/material.dart';
import 'package:seek_assesment/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({required this.product,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Text(product.title ?? "-"),
    );
  }
}