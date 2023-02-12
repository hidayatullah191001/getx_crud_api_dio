import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:getx_notes/app/helper/dio_helper.dart';
import 'package:get_storage/get_storage.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future register(String path,
      {required String name,
      required String email,
      required String password}) async {
    var body = {
      'name': name,
      'email': email,
      'password': password,
    };
    try {
      Response response = await _dio.post(
        ApiConst.baseUrl + path,
        data: jsonEncode(body),
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      print('eror : ${e.response!.data}');
      return e.response!.data;
    }
  }

  Future login(String path,
      {required String email, required String password}) async {
    var body = {
      'email': email,
      'password': password,
    };
    try {
      Response response = await _dio.post(
        ApiConst.baseUrl + path,
        data: jsonEncode(body),
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );
      return response;
    } on DioError catch (e) {
      print('eror : ${e.response!.data}');
      return e.response;
    }
  }

  Future createNote(String path,
      {required String title, required String notes}) async {
    var body = {
      'title': title,
      'body': notes,
    };
    final box = GetStorage();
    try {
      Response response = await _dio.post(
        ApiConst.baseUrl + path,
        data: jsonEncode(body),
        options: Options(
          headers: {"Authorization": "Bearer ${box.read('token')}"},
        ),
      );
      return response;
    } on DioError catch (e) {
      print('eror : ${e.response!.data}');
      return e.response;
    }
  }

  Future getNote(String path) async {
    final box = GetStorage();

    try {
      final response = await _dio.get(
        ApiConst.baseUrl + path,
        options: Options(
          headers: {"Authorization": "Bearer ${box.read('token')}"},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future deleteNote(String path, String id) async {
    final box = GetStorage();
    try {
      final response = await _dio.delete(
        ApiConst.baseUrl + path + '/$id',
        options: Options(
          headers: {"Authorization": "Bearer ${box.read('token')}"},
        ),
      );
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future getSingleNote(String path, String idNote) async {
    final box = GetStorage();
    try {
      final response = await _dio.get(
        ApiConst.baseUrl + path + '/${idNote}',
        options: Options(
          headers: {"Authorization": "Bearer ${box.read('token')}"},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future archivedNote(String path, String id) async {
    final box = GetStorage();
    try {
      final response = await _dio.post(
        ApiConst.baseUrl + path + '/$id/archive',
        options: Options(
          headers: {"Authorization": "Bearer ${box.read('token')}"},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future unarchivedNote(String path, String id) async {
    final box = GetStorage();
    try {
      final response = await _dio.post(
        ApiConst.baseUrl + path + '/$id/unarchive',
        options: Options(
          headers: {"Authorization": "Bearer ${box.read('token')}"},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future getArchiveNote(String path) async {
    final box = GetStorage();

    try {
      final response = await _dio.get(
        ApiConst.baseUrl + path + '/archived',
        options: Options(
          headers: {"Authorization": "Bearer ${box.read('token')}"},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
