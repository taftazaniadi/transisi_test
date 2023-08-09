import 'package:flutter/material.dart';
import 'package:get/get.dart';

showAlertDialog({required bool isDarkMode}) {
  AlertDialog alert = AlertDialog(
    backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
    content: Row(
      children: [
        CircularProgressIndicator(
          color: isDarkMode ? Colors.white : Colors.deepPurple,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
          ),
          child: Text(
            'Loading ...',
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    ),
  );

  showDialog(
    barrierDismissible: false,
    context: Get.context!,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
