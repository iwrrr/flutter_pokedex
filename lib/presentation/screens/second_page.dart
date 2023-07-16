import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/routes.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Second Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  AppNavigator.pop();
                },
                child: const Text("Back to Main Page"),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: (Get.arguments as List<String>)
                    .map((e) => Text(e))
                    .toList(),
              ),
              ElevatedButton(
                onPressed: () {
                  AppNavigator.push(Routes.pokemonInfo);
                },
                child: const Text("Go to Third Page"),
              )
            ],
          ),
        ));
  }
}
