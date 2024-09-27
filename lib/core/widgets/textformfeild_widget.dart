import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';

class TextFormFeildWidget extends StatelessWidget {
  const TextFormFeildWidget({
    super.key,
    required this.text,
    this.maxlines = 1,
    this.suffixIcon,
  });

  final String text;
  final int maxlines;
  final Widget? suffixIcon; // تغير النوع من IconData? إلى Widget?

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: getSmallTextStyle(color: AppColors.greyColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.greyColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColors.textColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColors.redColor,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.redColor,
            width: 2.0,
          ),
        ),
        suffixIcon: suffixIcon != null ? suffixIcon : null,
      ),
    );
  }
}
