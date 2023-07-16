import 'package:flutter/material.dart';
import 'package:pokedex/routes.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Third Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  AppNavigator.pop();
                },
                child: const Text("Back to Second Page"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  AppNavigator.popTo(Routes.home);
                },
                child: const Text("Back to Main Page"),
              )
            ],
          ),
        ));
  }
}
