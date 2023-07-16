import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/presentation/screens/home/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () {
          Get.off(const HomePage());
        },
        child: const Text("LOGIN"),
      ),
    ));
  }
}
