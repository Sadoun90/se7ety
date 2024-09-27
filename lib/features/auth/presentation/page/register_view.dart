import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_Button.dart';
import 'package:se7ety/core/widgets/textformfeild_widget.dart';
import 'package:se7ety/features/auth/presentation/page/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key, required this.index});
  final int index;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
                'سجل حساب جديد كـ"${handleUserType(widget.index)}"',
                style: getTitleTextStyle(
                    fontSize: 21, fontWeight: FontWeight.w600),
              ),
              Gap(15),
              // Name Field
              TextFormField(
                keyboardType: TextInputType.name,
                style: TextStyle(color: AppColors.textColor),
                decoration: InputDecoration(
                  hintText: 'الاسم',
                  hintStyle: getBodyTextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.primaryColor,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'من فضلك ادخل الاسم';
                  return null;
                },
              ),
              Gap(20),
              // Email Field (Left-aligned)
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
              Gap(20),
              CustomButton(text: 'تسجيل حساب ', onPressed: () {}),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('لدي حساب ؟ '),
                  TextButton(
                      onPressed: () {
                        PushWithReplacement(
                            context, LoginView(index: widget.index));
                      },
                      child: Text(
                        'سجل دخول',
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
