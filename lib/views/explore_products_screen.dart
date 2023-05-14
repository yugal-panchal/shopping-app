import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:seek_assesment/controllers/shopping_controller.dart';
import 'package:seek_assesment/views/style/text_style.dart';
import 'package:seek_assesment/views/widgets/product_card.dart';

class ExploreProducts extends StatelessWidget {
  final ShoppingController shopController = Get.put(ShoppingController());
  ExploreProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: GetX<ShoppingController>(builder: (controller) {
        return controller.products.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Products",
                        style: Style.bigBold,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset("assets/icons/up_down.svg"),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset("assets/icons/filter.svg"))
                        ],
                      )
                    ],
                  ),
                  Text(
                    "${controller.products.length} available products",
                    style: Style.h16,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.75,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) => ProductCard(
                        product: controller.products[index],
                      ),
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
