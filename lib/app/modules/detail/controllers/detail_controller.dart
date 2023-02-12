import 'package:get/get.dart';
import 'package:getx_notes/app/data/api/repository.dart';
import 'package:getx_notes/app/helper/dio_helper.dart';
import 'package:getx_notes/app/data/model/detail_model.dart' as dt;

class DetailController extends GetxController {
  //TODO: Implement DetailController
  late Rxn<dt.Data> noteData = Rxn<dt.Data>();
  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = "".obs;

  var id = Get.arguments;

  @override
  void onInit() {
    getDetailNote();
    super.onInit();
  }

  getDetailNote() async {
    isLoading(true);
    try {
      final result = await ApiClient()
          .getSingleNote(ApiConst.notes, Get.arguments)
          .then((value) => noteData.value = dt.DetailNote.fromJson(value).data);
      ;
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print(e);
    }
  }

  arsipNote() async {
    final result =
        await ApiClient().archivedNote(ApiConst.notes, id).then((value) {
      Get.snackbar('${value['status']}', '${value['message']}');
      getDetailNote();
    });
  }

  unarsipNote() async {
    final result =
        await ApiClient().unarchivedNote(ApiConst.notes, id).then((value) {
      Get.snackbar('${value['status']}', '${value['message']}');
      getDetailNote();
    });
  }
}
