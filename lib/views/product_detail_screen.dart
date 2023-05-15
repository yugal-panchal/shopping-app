import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:seek_assesment/controllers/shopping_controller.dart';
import 'package:seek_assesment/views/style/text_style.dart';
import 'package:seek_assesment/views/widgets/product_image_card.dart';
import 'package:seek_assesment/views/widgets/size_widget.dart';

import '../controllers/helpers/constants.dart';
import '../controllers/user_controller.dart';

class ProductDetails extends StatelessWidget {
  final ShoppingController shoppingController = Get.find<ShoppingController>();
  final UserController userController = Get.find<UserController>();
  ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ShoppingController>(builder: (controller) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () => Get.close(1),
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            shoppingController.currentProduct.value.isLiked
                ? IconButton(
                    onPressed: () {
                      shoppingController.productDisliked(
                          shoppingController.currentProduct.value.id ?? 0);
                      userController.removeLikedProducts(
                          shoppingController.currentProduct.value.id ?? 0);
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/heart_filled.svg",
                      color: Colors.white,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      shoppingController.productLiked(
                          shoppingController.currentProduct.value.id ?? 0);
                      userController.addLikedProducts(
                          shoppingController.currentProduct.value);
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/heart.svg",
                    ),
                  )
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CustomPaint(
                      painter: SemiCircle(),
                      child: Container(color: Colors.black),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: Get.height * 0.25,
                      child: controller.currentProduct.value.image == "" ||
                              controller.currentProduct.value.image == null
                          ? Image.asset("assets/pics/image_broken.jpg")
                          : Image(
                              image: NetworkImage(
                                  controller.currentProduct.value.image!),
                            ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: Get.width * 0.2,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => ProductImageCard(
                          image: controller.currentProduct.value.image!),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                      itemCount: 5),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Maps.category[controller.currentProduct.value.category] ??
                          "-",
                      style: Style.h16.copyWith(fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "\$${controller.currentProduct.value.price.toString()}",
                      style: Style.h16.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  controller.currentProduct.value.title ?? "-",
                  style: Style.h14.copyWith(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.black,
                ),
                ReadMoreText(
                  controller.currentProduct.value.description ?? "-",
                  trimLines: 3,
                  trimCollapsedText: "Show More",
                  trimExpandedText: "Show Less",
                ),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(height: 10),
                if ([KString.menClothes, KString.womenClothes]
                    .contains(controller.currentProduct.value.category))
                  SelectSize(),
                // const Spacer(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          fixedSize: const Size(double.maxFinite, 50),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        "Add to cart",
                        style: Style.h16.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class SemiCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    Offset topCentre = Offset(size.width / 2, -200);
    canvas.drawCircle(topCentre, 300, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
