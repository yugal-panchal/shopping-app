import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:seek_assesment/controllers/helpers/api_caller.dart';

import '../models/product.dart';

class  ShoppingController extends GetxController {
  final ApiCaller _apiCaller = ApiCaller();
  List<Product> products = <Product>[].obs;
  var currentProduct = Product().obs;
  var sizeFormat = "".obs;

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

  updateCurrentProduct(Product product) {
    currentProduct.value = product;
  }

  updateSizeFormat(String format) {
    sizeFormat.value = format;
  }

  productLiked(int id) {
    Product current = products.firstWhere((element) => element.id == id);
    current = current.copyWith(isLiked: true);
    currentProduct.value = current;
    for (int i=0;i<products.length;i++) {
      if (products[i].id == id) {
        products[i] = current;
        break;
      }
    }
  }

  productDisliked(int id) {
    Product current = products.firstWhere((element) => element.id == id);
    current = current.copyWith(isLiked: false);
    currentProduct.value = current;
    for (int i=0;i<products.length;i++) {
      if (products[i].id == id) {
        products[i] = current;
        break;
      }
    }
  }

  initializeLikedProduct(List<Product> likedProducts)async {
    await getAllProducts();
    for(int i =0;i<likedProducts.length;i++){
      for(int j=0;j<products.length;j++){
        if(likedProducts[i].id==products[j].id){
          products[j] = likedProducts[i];
          break;
        }
      }
    }
  }  
}
