import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_notes/app/data/api/repository.dart';
import 'package:getx_notes/app/helper/dio_helper.dart';
import 'package:getx_notes/app/routes/app_pages.dart';
import 'package:getx_notes/app/widgets/alert.dart';

class LoginController extends GetxController {
  late TextEditingController emailC;
  late TextEditingController passwordC;
  @override
  void onInit() {
    emailC = TextEditingController();
    passwordC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailC.dispose();
    passwordC.dispose();
  }

  void login(BuildContext context) async {
    Alert().alertLoading(context);
    try {
      final result = await ApiClient()
          .login(ApiConst.login, email: emailC.text, password: passwordC.text)
          .then((value) {
        if (value.statusCode == 200) {
          final box = GetStorage();
          box.write('token', value.data['data']['accessToken']);
          Get.offAllNamed(Routes.HOME);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
