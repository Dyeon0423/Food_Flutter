import 'package:get/get.dart';

import '../shared/global.dart';

/**
 * 회원 관련된 통신을 담당하는  클래스
 */
class UserConnect extends GetConnect{
  ///회원가입 통신
  Future sendRegister(String email, String name, String password) async {
    Response response = await post('/api/user/register', {
      'email': email,
      'name': name,
      'password': password,
    });

    Map<String, dynamic> body = response.body;

    if(body['result'] == 'fail') {
      throw Exception(body['message']);
    }
    return body['access_token'];
  }

  ///로그인 통신
  Future sendLogin(String email, String password) async {
    Response response = await post('/api/user/login', {
      'email': email,
      'password': password,
    });

    Map<String, dynamic> body = response.body;

    if(body['result'] == 'fail') {
      throw Exception(body['message']);
    }
    return body['access_token'];
  }
  
  //나의 정보 통신
  Future getMyInfo() async {}

  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.apiRoot;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }
}