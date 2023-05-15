import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:seek_assesment/controllers/shopping_controller.dart';

import '../../controllers/helpers/constants.dart';
import '../../controllers/user_controller.dart';
import '../../models/product.dart';
import '../product_detail_screen.dart';
import '../style/text_style.dart';

class LikedCard extends StatelessWidget {
  final Product likedProduct;
  final ShoppingController shoppingController = Get.find<ShoppingController>();
  final UserController userController = Get.find<UserController>();
  LikedCard({required this.likedProduct, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: Get.width * 0.37,
      height: Get.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              shoppingController.updateCurrentProduct(likedProduct);
              Get.to(() => ProductDetails());
            },
            child: Container(
              alignment: Alignment.center,
              height: Get.height * 0.15,
              child: likedProduct.image == "" || likedProduct.image == null
                  ? Image.asset("assets/pics/image_broken.jpg")
                  : Image(
                      image: NetworkImage(likedProduct.image!),
                    ),
            ),
          ),
          Positioned(
              right: 5,
              top: 5,
              child: IconButton(
                onPressed: () {
                  shoppingController.productDisliked(likedProduct.id ?? 0);
                  userController.removeLikedProducts(likedProduct.id ?? 0);
                  userController.getLikedProducts();
                },
                icon: SvgPicture.asset(
                  "assets/icons/heart_filled.svg",
                  color: Colors.black,
                ),
              )),
          Positioned(
            bottom: 0,
            child: Container(
                alignment: Alignment.bottomLeft,
                width: Get.width * 0.37,
                height: Get.height * 0.2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        Maps.category[likedProduct.category] ?? "-",
                        style: Style.h16.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        likedProduct.title ?? "-",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 5),
                      Text("\$${likedProduct.price.toString()}",
                          style:
                              Style.h14.copyWith(fontWeight: FontWeight.bold)),
                    ])),
          ),
        ],
      ),
    );
  }
}
