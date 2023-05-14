import 'package:flutter/material.dart';

class ProductImageCard extends StatelessWidget {
  final String image;
  const ProductImageCard({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(244, 244, 244, 1),
      ),
      child: Image(image: NetworkImage(image)),
    );
  }
}
