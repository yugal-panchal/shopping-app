import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seek_assesment/controllers/helpers/toast.dart';
import 'package:seek_assesment/controllers/user_controller.dart';
import 'package:seek_assesment/views/dashboard_screen.dart';
import 'package:seek_assesment/views/style/text_style.dart';

class LoginScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final TextEditingController nameController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              "Enter Details",
              style: Style.bigBold,
            ),
            const SizedBox(height: 40),
            TextField(
              controller: nameController,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(color: Colors.white, width: 0)),
                filled: true,
                hintText: "Enter your name",
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () async {
                if (nameController.text.trim() != "") {
                  await userController.addUser(nameController.text.trim());
                  Get.to(() => const DashboardScreen());
                } else{
                  showToast("Enter a valid value");
                }
              },
              style: TextButton.styleFrom(
                  fixedSize: const Size(double.maxFinite, 50),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Text(
                "Login",
                style: Style.h16
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
