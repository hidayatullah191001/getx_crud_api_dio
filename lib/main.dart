import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  final box = GetStorage();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: box.read('token') != null ? Routes.HOME : Routes.LOGIN,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
    ),
  );
}
