import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_notes/app/helper/date_format.dart';
import 'package:getx_notes/app/routes/app_pages.dart';
import 'package:getx_notes/app/widgets/alert.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/archive_controller.dart';

class ArchiveView extends GetView<ArchiveController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archive Notes'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Alert().alertConfirm(
                context,
                confirm: controller.logout,
                message: "Do you want to logout!",
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return Shimmer.fromColors(
                baseColor: const Color.fromARGB(255, 214, 213, 213),
                highlightColor: Colors.grey[300]!,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {},
                        title: Text(""),
                        trailing: IconButton(
                          onPressed: () {
                            // controller.hapus(note.id!);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red[900],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            if (controller.isError.value) {
              return Text(controller.isError.value.toString());
            }
            if (controller.noteData.value.length < 1) {
              return const Center(child: Text('Data Not Found'));
            }
            return ListView.builder(
              itemCount: controller.noteData.value.length,
              itemBuilder: (context, index) {
                final note = controller.noteData.value[index];
                return Card(
                  child: ListTile(
                    onTap: () {
                      Get.toNamed(Routes.DETAIL, arguments: note.id!);
                    },
                    title: Text(note.title!),
                    subtitle: Text(formatDate(note.createdAt!)),
                    trailing: IconButton(
                      onPressed: () {
                        controller.hapus(note.id!);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[900],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
