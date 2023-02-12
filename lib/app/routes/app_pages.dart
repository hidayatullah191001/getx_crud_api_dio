import 'package:get/get.dart';

import 'package:getx_notes/app/modules/add/bindings/add_binding.dart';
import 'package:getx_notes/app/modules/add/views/add_view.dart';
import 'package:getx_notes/app/modules/archive/bindings/archive_binding.dart';
import 'package:getx_notes/app/modules/archive/views/archive_view.dart';
import 'package:getx_notes/app/modules/detail/bindings/detail_binding.dart';
import 'package:getx_notes/app/modules/detail/views/detail_view.dart';
import 'package:getx_notes/app/modules/home/bindings/home_binding.dart';
import 'package:getx_notes/app/modules/home/views/home_view.dart';
import 'package:getx_notes/app/modules/login/bindings/login_binding.dart';
import 'package:getx_notes/app/modules/login/views/login_view.dart';
import 'package:getx_notes/app/modules/register/bindings/register_binding.dart';
import 'package:getx_notes/app/modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ADD,
      page: () => AddView(),
      binding: AddBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.ARCHIVE,
      page: () => ArchiveView(),
      binding: ArchiveBinding(),
    ),
  ];
}
