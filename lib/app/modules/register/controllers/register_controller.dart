import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_notes/app/data/api/repository.dart';
import 'package:getx_notes/app/helper/dio_helper.dart';
import 'package:getx_notes/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  late TextEditingController nameC;
  late TextEditingController emailC;
  late TextEditingController passwordC;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    nameC = TextEditingController();
    emailC = TextEditingController();
    passwordC = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    nameC.dispose();
    emailC.dispose();
    passwordC.dispose();
  }

  void increment() => count.value++;

  void register(BuildContext context) async {
    final result = await ApiClient().register(
      ApiConst.register,
      name: nameC.text,
      email: emailC.text,
      password: passwordC.text,
    );
    Get.offAndToNamed(Routes.LOGIN);
  }
}
