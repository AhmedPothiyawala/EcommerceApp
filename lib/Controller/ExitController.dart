import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ExitConfirmationController extends GetxController {
  Future<bool> showExitConfirmation() async {
    final result = await Get.dialog(
      AlertDialog(
        title: const Text('Are you sure you want to exit?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(result: false);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: true);
              if (Platform.isIOS) {
                exit(0);
              } else {
                SystemNavigator.pop(animated: true);
              }
            },
            child: const Text('Yes'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
    return result ?? false;
  }
}
