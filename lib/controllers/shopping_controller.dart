import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:seek_assesment/controllers/helpers/api_caller.dart';

import '../models/product.dart';

class ShoppingController extends GetxController {
  final ApiCaller _apiCaller = ApiCaller();
  List<Product> products = <Product>[].obs;
  var currentProduct = Product().obs;
  var sizeFormat = "".obs;
  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  getAllProducts() async {
    List<Product> allProducts = [];
    try {
      var response =
          await _apiCaller.get(url: "https://fakestoreapi.com/products");
      if (response != null) {
        for (var product in response) {
          allProducts.add(Product.fromJson(product));
        }
        products.addAll(allProducts);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  updateCurrentProduct(Product product){
    currentProduct.value = product;
  }

  updateSizeFormat(String format){
    sizeFormat.value = format;
  }
}
