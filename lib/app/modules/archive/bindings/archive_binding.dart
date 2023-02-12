import 'package:get/get.dart';

import '../controllers/archive_controller.dart';

class ArchiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArchiveController>(
      () => ArchiveController(),
    );
  }
}
