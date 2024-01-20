import 'package:flutter/material.dart';
import 'package:food_flutter/src/controller/user_controller.dart';
import 'package:get/get.dart';

import '../home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userController = Get.put(UserController());
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() async {
    if(_formkey.currentState!.validate()) {
      final String email = _emailController.text;
      final String password = _passwordController.text;

      await userController.login(email, password);

      Get.off(() => const Home());
      //로그인 로직 추가
      //로그인 성공 시, 다음 화면으로 이동 혹은 처리
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [

            const SizedBox(height: 20),
            //이메일 입력부분
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: '이메일',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '이메일을 입력하세요.';
                }
                if(value.length < 5){
                  return '이메일이 그렇게 짧을리가 있나요?';
                }
                return null;
              },
            ),

            const SizedBox(height: 10),
            //비밀번호 입력부분
            TextFormField(
              obscureText: true,
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: '비밀번호',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '비밀번호를 입력하세요.';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: _submitForm, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 158, 116, 216),
              ),
              child: const Text(
                '로그인',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}