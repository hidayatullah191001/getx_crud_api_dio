import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_notes/app/modules/archive/controllers/archive_controller.dart';
import 'package:getx_notes/app/modules/home/controllers/home_controller.dart';

import '../controllers/detail_controller.dart';
import 'package:getx_notes/app/helper/date_format.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());
    var arsipController = Get.put(ArchiveController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Catatan'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        leading: IconButton(
          onPressed: () {
            Get.back();
            homeController.getNote();
            arsipController.getArsipNote();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '${controller.noteData.value?.title}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.noteData.value?.archived == false
                            ? controller.arsipNote()
                            : controller.unarsipNote();
                      },
                      icon: controller.noteData.value?.archived == false
                          ? Icon(Icons.favorite_border,
                              size: 30, color: Colors.red[400])
                          : Icon(Icons.favorite,
                              size: 30, color: Colors.red[400]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatDate(
                        controller.noteData.value?.createdAt ??
                            DateTime.now().toIso8601String(),
                      ),
                    ),
                    controller.noteData.value?.archived == false
                        ? const Text('Status : Unarchived')
                        : const Text('Status : Archived'),
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  controller.noteData.value?.body ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
