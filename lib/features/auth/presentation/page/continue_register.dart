import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_Button.dart';
import 'package:se7ety/features/auth/presentation/page/login_view.dart';

class ContinueRegister extends StatefulWidget {
  const ContinueRegister({super.key});

  @override
  State<ContinueRegister> createState() => _ContimueRegisterState();
}

class _ContimueRegisterState extends State<ContinueRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          'اكمال عملية التسجيل',
          style: getBodyTextStyle(color: AppColors.whiteColor, fontSize: 18),
        ),
        leading: BackButton(
          color: AppColors.whiteColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/doc.png'),
              ),
              Gap(15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    // 'سجل حساب جديد كـ"${handleUserType(widget.index)}"',
                    'التخصص',
                    style: getTitleTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor),
                  ),
                ],
              ),
              Gap(15),
              // Name Field
              TextFormField(
                keyboardType: TextInputType.name,
                style: TextStyle(color: AppColors.textColor),
                decoration: InputDecoration(
                    hintText: 'دكتور عظام',
                    hintStyle: getBodyTextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.done,
                          color: AppColors.primaryColor,
                        ))),
                validator: (value) {
                  if (value!.isEmpty) return 'من فضلك ادخل الاسم';
                  return null;
                },
              ),
              Gap(10),
              // Email Field (Left-aligned)
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    // 'سجل حساب جديد كـ"${handleUserType(widget.index)}"',
                    'نبذة تعريفية',
                    style: getTitleTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor),
                  ),
                ],
              ),
              Gap(10),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textDirection: TextDirection.ltr,
                style: TextStyle(color: AppColors.textColor),
                maxLines: 6,
                decoration: InputDecoration(
                  hintText:
                      'سجل المعلومات الطبية العامة مثل تعليمك الاكاديمي وخبراتك السابقة ...',
                  hintStyle: getBodyTextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              Gap(15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              Gap(5),
              // Password Field (Stars next to eye icon)
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    // 'سجل حساب جديد كـ"${handleUserType(widget.index)}"',
                    'عنوان العيادة',
                    style: getTitleTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor),
                  ),
                ],
              ),
              Gap(10),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(color: AppColors.textColor),
                decoration: InputDecoration(
                  hintText: '5 شارع مصدق -الدقي-الجيزة',
                  hintStyle: getBodyTextStyle(color: Colors.grey, fontSize: 14),

                  // suffixIcon: IconButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       isVisible = !isVisible;
                  //     });
                  //   },
                  //   icon: Icon((isVisible)
                  //       ? Icons.remove_red_eye
                  //       : Icons.visibility_off_rounded),
                  //   color: AppColors.primaryColor,
                  // ),
                ),
              ),
              Gap(5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    // 'سجل حساب جديد كـ"${handleUserType(widget.index)}"',
                    'التخصص',
                    style: getTitleTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor),
                  ),
                ],
              ),
              Gap(10),
              // Name Field
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      style: TextStyle(color: AppColors.textColor),
                      decoration: InputDecoration(
                          hintText: 'AM 10:00',
                          hintStyle: getBodyTextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            Icons.watch_later_outlined,
                            color: AppColors.primaryColor,
                          )),
                      validator: (value) {
                        if (value!.isEmpty) return 'من فضلك ادخل الاسم';
                        return null;
                      },
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      style: TextStyle(color: AppColors.textColor),
                      decoration: InputDecoration(
                          hintText: 'PM 10:00',
                          hintStyle: getBodyTextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            Icons.watch_later_outlined,
                            color: AppColors.primaryColor,
                          )),
                      validator: (value) {
                        if (value!.isEmpty) return 'من فضلك ادخل الاسم';
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const Gap(15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    // 'سجل حساب جديد كـ"${handleUserType(widget.index)}"',
                    '  رقم الهاتف 1',
                    style: getTitleTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor),
                  ),
                ],
              ),
              const Gap(10),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(color: AppColors.textColor),
                decoration: InputDecoration(
                  hintText: '20xxxxxxxxx',

                  hintStyle: getBodyTextStyle(color: Colors.grey, fontSize: 14),

                  // suffixIcon: IconButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       isVisible = !isVisible;
                  //     });
                  //   },
                  //   icon: Icon((isVisible)
                  //       ? Icons.remove_red_eye
                  //       : Icons.visibility_off_rounded),
                  //   color: AppColors.primaryColor,
                  // ),
                ),
              ),
              const Gap(15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    // 'سجل حساب جديد كـ"${handleUserType(widget.index)}"',
                    ' رقم الهاتف 2 (اختياري)',
                    style: getTitleTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor),
                  ),
                ],
              ),
              const Gap(10),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(color: AppColors.textColor),
                decoration: InputDecoration(
                  hintText: '20xxxxxxxxx',
                  hintStyle: getBodyTextStyle(color: Colors.grey, fontSize: 15),
                  // suffixIcon: IconButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       isVisible = !isVisible;
                  //     });
                  //   },
                  //   icon: Icon((isVisible)
                  //       ? Icons.remove_red_eye
                  //       : Icons.visibility_off_rounded),
                  //   color: AppColors.primaryColor,
                  // ),
                ),
              ),
              const Gap(40),
              CustomButton(text: 'التسجيل', width: 330, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
