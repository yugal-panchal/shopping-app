import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seek_assesment/views/style/text_style.dart';
import 'package:seek_assesment/views/widgets/liked_product_card.dart';

import '../controllers/user_controller.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final UserController userController = Get.find<UserController>();

  @override
  void initState() {
    userController.getLikedProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Obx(() {
        if (userController.hasLikedProducts.value) {
          if (userController.likedProducts.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Liked Products",
                  style: Style.bigBold,
                ),
                Text(
                  "${userController.likedProducts.length} available products",
                  style: Style.h16,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: userController.likedProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.75,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return LikedCard(
                          likedProduct: userController.likedProducts[index],
                        );
                      }),
                ),
              ],
            );
          }
        }
        return Center(
          child: Text(
            "No liked products",
            style: Style.h18.copyWith(fontWeight: FontWeight.bold),
          ),
        );
      }),
    );
  }
}
