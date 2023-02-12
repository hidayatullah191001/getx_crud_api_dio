import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_notes/app/data/api/repository.dart';
import 'package:getx_notes/app/helper/dio_helper.dart';
import 'package:getx_notes/app/modules/home/controllers/home_controller.dart';
import 'package:getx_notes/app/routes/app_pages.dart';

class AddController extends GetxController {
  //TODO: Implement HomeController
  late TextEditingController titleC;
  late TextEditingController noteC;

  @override
  void onInit() {
    super.onInit();
    titleC = TextEditingController();
    noteC = TextEditingController();
  }

  @override
  void onClose() {
    super.dispose();
    titleC.dispose();
    noteC.dispose();
  }

  void createNote() async {
    final result = await ApiClient()
        .createNote(
      ApiConst.notes,
      title: titleC.text,
      notes: noteC.text,
    )
        .then((value) {
      var homeController = Get.put(HomeController());
      homeController.getNote();
      Get.back();
    });
  }

  void logout() {
    final box = GetStorage();
    box.remove('token').then(
          (_) => Get.offAndToNamed(Routes.LOGIN),
        );
  }
}
