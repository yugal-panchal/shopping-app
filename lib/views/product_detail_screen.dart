import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/heart.svg"),
          ),
        ],
      ),
      body: Column(children: [
        
      ]),
    );
  }
}
