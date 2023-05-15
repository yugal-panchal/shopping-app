import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:seek_assesment/models/product.dart';
import 'package:seek_assesment/views/product_detail_screen.dart';
import 'package:seek_assesment/views/style/text_style.dart';

import '../../controllers/helpers/constants.dart';
import '../../controllers/shopping_controller.dart';
import '../../controllers/user_controller.dart';

class ProductCard extends StatelessWidget {
  final int index;
  final ShoppingController shoppingController = Get.find<ShoppingController>();
  final UserController userController = Get.find<UserController>();
  ProductCard({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                if (shoppingController.showingSearch.value) {
                  shoppingController.updateCurrentProduct(
                      shoppingController.searchList[index]);
                } else {
                  shoppingController
                      .updateCurrentProduct(shoppingController.products[index]);
                }
                Get.to(() => ProductDetails());
              },
              child: Container(
                alignment: Alignment.center,
                height: Get.height * 0.15,
                child: !shoppingController.showingSearch.value
                    ? shoppingController.products[index].image == "" ||
                            shoppingController.products[index].image == null
                        ? Image.asset("assets/pics/image_broken.jpg")
                        : Image(
                            image: NetworkImage(
                                shoppingController.products[index].image!),
                          )
                    : shoppingController.searchList[index].image == "" ||
                            shoppingController.searchList[index].image == null
                        ? Image.asset("assets/pics/image_broken.jpg")
                        : Image(
                            image: NetworkImage(
                                shoppingController.searchList[index].image!),
                          ),
              ),
            ),
            Positioned(
                right: 5,
                top: 5,
                child: !shoppingController.showingSearch.value
                    ? shoppingController.products[index].isLiked
                        ? IconButton(
                            onPressed: () {
                              shoppingController.productDisliked(
                                  shoppingController.products[index].id ?? 0);
                              userController.removeLikedProducts(
                                  shoppingController.products[index].id ?? 0);
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/heart_filled.svg",
                              color: Colors.black,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              shoppingController.productLiked(
                                  shoppingController.products[index].id ?? 0);
                              userController.addLikedProducts(
                                  shoppingController.products[index]);
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/heart.svg",
                              color: Colors.black,
                            ),
                          )
                    : shoppingController.searchList[index].isLiked
                        ? IconButton(
                            onPressed: () {
                              shoppingController.productDisliked(
                                  shoppingController.searchList[index].id ?? 0);
                              userController.removeLikedProducts(
                                  shoppingController.searchList[index].id ?? 0);
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/heart_filled.svg",
                              color: Colors.black,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              shoppingController.productLiked(
                                  shoppingController.searchList[index].id ?? 0);
                              userController.addLikedProducts(
                                  shoppingController.searchList[index]);
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/heart.svg",
                              color: Colors.black,
                            ),
                          )),
            Positioned(
              bottom: 0,
              child: Container(
                alignment: Alignment.bottomLeft,
                width: Get.width * 0.37,
                height: Get.height * 0.2,
                child: !shoppingController.showingSearch.value
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                            Text(
                              Maps.category[shoppingController
                                      .products[index].category] ??
                                  "-",
                              style: Style.h16
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              shoppingController.products[index].title ?? "-",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 5),
                            Text(
                                "\$${shoppingController.products[index].price.toString()}",
                                style: Style.h14
                                    .copyWith(fontWeight: FontWeight.bold)),
                          ])
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                            Text(
                              Maps.category[shoppingController
                                      .searchList[index].category] ??
                                  "-",
                              style: Style.h16
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              shoppingController.searchList[index].title ?? "-",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 5),
                            Text(
                                "\$${shoppingController.searchList[index].price.toString()}",
                                style: Style.h14
                                    .copyWith(fontWeight: FontWeight.bold)),
                          ]),
              ),
            ),
          ],
        ),
      );
    });
  }
}
