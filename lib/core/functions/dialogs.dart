
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ety/core/utils/colors.dart';

void showErrorDialog(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.redColor,
      content: Text(text),
    ),
  );
}

void showSuccessDialog(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primaryColor,
      content: Text(text),
    ),
  );
}

// ignore: non_constant_identifier_names
ShowLoadingDialogs(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Lottie.asset('assets/images/loading.json');
    },
  );
}
