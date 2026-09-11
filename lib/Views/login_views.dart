import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'lib/style.dart';
import 'lib/Controller/simple_ui.dart';

class LoginView extends StatelessWidget {
  final SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          if (simpleUIController.isLoading.value) {
            return Lottie.asset('assets/loading.json', width: 200, height: 200);
          } else {
            return ElevatedButton(
              onPressed: () {
                simpleUIController.setLoading(true);
                Future.delayed(Duration(seconds: 2), () {
                  simpleUIController.setLoading(false);
                });
              },
              child: Text('Login'),
            );
          }
        }),
      ),
    );
  }
}
