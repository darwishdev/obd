import 'package:flutter/material.dart';

class UiHelper {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      useRootNavigator: true,
      barrierDismissible: false,
      barrierColor: Colors.black12,
      builder: (context) => AlertDialog(
        title: const Center(
          child: CircularProgressIndicator(),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  // Post Frame Callbacks
  static void postBuildCallback(void Function(Duration) callback) {
    WidgetsBinding.instance.addPostFrameCallback(callback);
  }
} // Class UiHelper
