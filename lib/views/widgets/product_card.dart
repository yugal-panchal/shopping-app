import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:seek_assesment/models/product.dart';
import 'package:seek_assesment/views/product_detail_screen.dart';
import 'package:seek_assesment/views/style/text_style.dart';

import '../../controllers/helpers/text_maping.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: MediaQuery.of(context).size.width * 0.37,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => Get.to(const ProductDetails()),
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.15,
              child: product.image == "" || product.image == null
                  ? Image.asset("assets/pics/image_broken.jpg")
                  : Image(
                      image: NetworkImage(product.image!),
                    ),
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: SvgPicture.asset(
              "assets/icons/heart.svg",
              color: Colors.black,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              alignment: Alignment.bottomLeft,
              width: MediaQuery.of(context).size.width * 0.37,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      Maps.category[product.category] ?? "-",
                      style: Style.h16.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product.title ?? "-",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 5),
                    Text("\$${product.price.toString()}",
                        style: Style.h14.copyWith(fontWeight: FontWeight.bold)),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
