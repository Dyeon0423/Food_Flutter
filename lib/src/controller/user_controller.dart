import 'package:flutter/material.dart';
import 'package:food_flutter/src/connect/user_connect.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

/**
 * 회원 동작과 관련된 모든 상태들을 공통으로 관리하는 클래스
 */
class UserController extends GetxController{
  final userConnection = Get.put(UserConnect());

  var user;

  Future<bool> isLogin() async {
    return _storage.hasData('access_token');
  }
  
  /// 회원가입을 시도하는 함수, 아마 connect를 호출할것이다.
  Future register(String email, String name, String password) async {
    try {
      String token = await userConnection.sendRegister(email, name, password);
    } catch(e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("$e"),
      ));
    }
  }

  /// 로그인을 시도하는 함수, 아마 connect를 호출할것이다.
  Future login(String email, String password) async {
    try {
      String token = await userConnection.sendLogin(email, password);
    } catch(e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("$e"),
        ));
    }
  }

  Future mypage() async {}
}