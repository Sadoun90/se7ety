import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_Button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.index});
  final int index;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isVisible = true;

  String handleUserType(int index) {
    return index == 0 ? 'دكتور' : 'مريض';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: BackButton(
          color: AppColors.primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 230,
                ),
              ),
              Text(
                'سجل دخول الان كـ"${handleUserType(widget.index)}"',
                style: getTitleTextStyle(
                    fontSize: 21, fontWeight: FontWeight.w600),
              ),

              Gap(20),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textDirection: TextDirection.ltr,
                style: TextStyle(color: AppColors.textColor),
                decoration: InputDecoration(
                  hintText: 'mosad22@gmail.com',
                  hintStyle: getBodyTextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: AppColors.primaryColor,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'من فضلك ادخل البريد الالكتروني';
                  return null;
                },
              ),
              Gap(20),
              // Password Field (Stars next to eye icon)
              TextFormField(
                obscureText: isVisible,
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(color: AppColors.textColor),
                decoration: InputDecoration(
                  hintText: '********',
                  hintStyle: getBodyTextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppColors.primaryColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: Icon((isVisible)
                        ? Icons.remove_red_eye
                        : Icons.visibility_off_rounded),
                    color: AppColors.primaryColor,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'من فضلك ادخل كلمة المرور';
                  return null;
                },
              ),
              Gap(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'نسيت كلمة السر؟',
                        style: getBodyTextStyle(),
                      )),
                ],
              ),
              Gap(10),
              CustomButton(text: 'تسجيل الدخول ', onPressed: () {}),
              Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ليس لدي حساب ؟ '),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'سجل الان',
                        style: getBodyTextStyle(color: AppColors.primaryColor),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
