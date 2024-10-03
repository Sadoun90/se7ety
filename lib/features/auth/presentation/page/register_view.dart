import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/enum/user_type_enum.dart';
import 'package:se7ety/core/functions/dialogs.dart';
import 'package:se7ety/core/functions/email_validate.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_Button.dart';
import 'package:se7ety/core/widgets/textformfeild_widget.dart';
import 'package:se7ety/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:se7ety/features/auth/presentation/bloc/auth_event.dart';
import 'package:se7ety/features/auth/presentation/bloc/auth_state.dart';
import 'package:se7ety/features/auth/presentation/page/continue_register.dart';
import 'package:se7ety/features/auth/presentation/page/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key, required this.userType});
  final UserType userType;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisible = true;

  String handleUserType() {
    return widget.userType == UserType.doctor ? 'دكتور' : 'مريض';
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
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            ShowLoadingDialogs(context);
          } else if (state is RegisterSuccessState) {
            Navigator.pop(context);
          } else if (state is AuthErrorState) {
            Navigator.pop(context);
            showErrorDialog(context, state.error);
          }
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                    'سجل حساب جديد كـ"${handleUserType()}"',
                    style: getTitleTextStyle(
                        fontSize: 21, fontWeight: FontWeight.w600),
                  ),
                  Gap(15),
                  // Name Field
                  TextFormField(
                    controller: _displayName,
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
                    controller: _emailController,
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
                      if (value!.isEmpty) {
                        return 'من فضلك ادخل الايميل';
                      } else if (!emailValidate(value)) {
                        return 'من فضلك ادخل الايميل صحيحا';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Gap(20),
                  // Password Field (Stars next to eye icon)
                  TextFormField(
                    controller: _passwordController,
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
                  CustomButton(
                      text: 'تسجيل حساب ',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(RegisterEvent(
                                email: _emailController.text,
                                password: _passwordController.text,
                                name: _displayName.text,
                                userType: widget.userType,
                              ));
                        }
                      }),
                  Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('لدي حساب ؟ '),
                      TextButton(
                          onPressed: () {
                            PushWithReplacement(
                                context,
                                LoginView(
                                  userType: widget.userType,
                                ));
                          },
                          child: Text(
                            'سجل دخول',
                            style:
                                getBodyTextStyle(color: AppColors.primaryColor),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
