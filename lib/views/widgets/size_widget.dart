import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:seek_assesment/controllers/shopping_controller.dart';

import '../../controllers/helpers/constants.dart';
import '../style/text_style.dart';

class SelectSize extends StatelessWidget {
  final ShoppingController shoppingController = Get.find<ShoppingController>();
  SelectSize({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ShoppingController>(builder: (controller) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Size",
                style: Style.h16.copyWith(fontWeight: FontWeight.bold),
              ),
              GroupButton(
                buttons: Maps.size.keys.toList(),
                onSelected: (value, index, isSelected) =>
                    shoppingController.updateSizeFormat(value),
                buttonBuilder: (selected, value, context) => selected
                    ? Text(
                        value,
                        style: Style.h14.copyWith(fontWeight: FontWeight.bold),
                      )
                    : Text(
                        value,
                        style: Style.h14.copyWith(color: Colors.grey),
                      ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GroupButton(
              buttonBuilder: (selected, value, context) => selected
                  ? Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Text(
                        value,
                        style: Style.h16.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    )
                  : Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Text(
                        value,
                        style: Style.h12.copyWith(color: Colors.black),
                      ),
                    ),
              buttons: Maps.size[controller.sizeFormat.value]?.toList() ?? []),
          const SizedBox(height: 20),
        ],
      );
    });
  }
}
