import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seek_assesment/controllers/helpers/toast.dart';
import 'package:seek_assesment/models/product.dart';

class UserController extends GetxController {
  var name = "".obs;
  List likedProductsJson = [].obs;
  List<Product> likedProducts = <Product>[].obs;
  var hasLikedProducts = true.obs;

  // @override
  // void onInit(){
  //   addUser(userName)
  //   super.onInit();
  // }

  addUser(String userName) async {
    try {
      name.value = userName;
      bool isDocExists = false;
      CollectionReference user = FirebaseFirestore.instance.collection("users");
      final snapshot = await user.get();
      for (var element in snapshot.docs) {
        element.id == name.value;
        isDocExists = true;
      }
      if (isDocExists) {
        getLikedProducts();
      } else {
        user.doc(name.value).set({"liked_products": likedProductsJson});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  addLikedProducts(Product likedProduct) {
    var likedProductJson = likedProduct.toJson();
    Rating rating = likedProductJson["rating"];
    likedProductJson["rating"] = rating.toJson();
    // likedProductJson.remove("rating");
    likedProductsJson.add(likedProductJson);
    CollectionReference user = FirebaseFirestore.instance.collection("users");
    user
        .doc(name.value)
        .set({"liked_products": likedProductsJson})
        .then((_) => showToast("Cloud Firestore Updated"))
        .catchError((e) {
          showToast("Error updating Cloud Firestore");
          debugPrint(e.toString());
        });
  }

  removeLikedProducts(int dislikedPrductId) {
    likedProductsJson
        .removeWhere((element) => element["id"] == dislikedPrductId);
    CollectionReference user = FirebaseFirestore.instance.collection("users");
    user
        .doc(name.value)
        .set({"liked_products": likedProductsJson})
        .then((_) => showToast("Cloud Firestore Updated"))
        .catchError((e) {
          showToast("Error updating Cloud Firestore");
          debugPrint(e.toString());
        });
  }

  getLikedProducts() async {
    CollectionReference user = FirebaseFirestore.instance.collection("users");
    var docDataSnapsot;
    likedProducts.clear();
    docDataSnapsot = await user.doc(name.value).get();
    Map<String, dynamic> docData = docDataSnapsot.data();
    for (var liked in docData["liked_products"]) {
      likedProducts.add(Product.fromJson(liked));
    }
    if (likedProducts.isEmpty) {
      hasLikedProducts.value = false;
    } else {
      hasLikedProducts.value = true;
    }
  }
}
