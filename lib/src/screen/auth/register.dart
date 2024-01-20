import 'package:flutter/material.dart';
import 'package:food_flutter/src/controller/user_controller.dart';
import 'package:get/get.dart';

import '../home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final userController = Get.put(UserController());
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void _submitForm() async{
    if(_formkey.currentState!.validate()) {
      final String email = _emailController.text;
      final String password = _passwordController.text;
      final String name = _nameController.text;

      await userController.register(email, name, password);

      Get.off(() => const Home());
      //회원가입 로직 추가
      //회원가입 성공 시, 다음 화면으로 이동 혹은 처리
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('회원 가입')),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [

            const SizedBox(height: 20),

            //이메일 입력 부분
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

            const SizedBox(height: 10),

            //이름 입력 부분
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '이름',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '이름을 입력하세요.';
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
                '회원 가입',
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