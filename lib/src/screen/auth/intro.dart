import 'package:flutter/material.dart';
import 'package:food_flutter/src/screen/auth/login.dart';

import 'register.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '맛집 소개 어플',
                      style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 158, 116, 216)),
                    ),

                    const SizedBox(height: 20),

                    Image.asset('asset/logo.png', width: 200, height: 200),
                    //Container(color: Colors.grey, width: 200, height: 200),
                  ],
                ),
              ),
              SizedBox(
                  width: 200,
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      // 시작하기를 클릭하면 회원가입 창으로 이동
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Register(),
                        ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 158, 116, 216),
                    ),
                    child: const Text(
                      '시작하기',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color:Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('이미 계정이 있나요? '),
                    TextButton(onPressed: () {
                       // 시작하기를 클릭하면 회원가입 창으로 이동
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Login(),
                        ));
                    }, child: const Text('로그인'))
                  ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}