import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_notes/app/data/api/repository.dart';
import 'package:getx_notes/app/data/model/note_model.dart' as nm;
import 'package:getx_notes/app/helper/dio_helper.dart';
import 'package:getx_notes/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = "".obs;
  var noteData = <nm.Data>[].obs;

  @override
  void onInit() {
    getNote();
    super.onInit();
  }

  Future<List<nm.Data>> getNote() async {
    isLoading(true);
    try {
      final result = await ApiClient().getNote(ApiConst.notes);
      var note = nm.NoteModel.fromJson(result).data!;
      if (note.isNotEmpty) {
        isLoading(false);
        isError(false);
        note.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
        noteData.assignAll(note);
        noteData.refresh();
      } else {
        isLoading(false);
      }
      return note;
    } catch (e) {
      isLoading(false);
      isError(true);
      errmsg(e.toString());
      throw Exception(e);
    }
  }

  void hapus(String id) async {
    final result = await ApiClient()
        .deleteNote(ApiConst.notes, id)
        .then((value) => getNote());
  }

  void logout() {
    final box = GetStorage();
    box.remove('token').then(
          (_) => Get.offAndToNamed(Routes.LOGIN),
        );
  }
}
