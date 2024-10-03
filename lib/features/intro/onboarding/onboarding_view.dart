import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/services/local_storage.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_Button.dart';
import 'package:se7ety/features/intro/onboarding/on_boarding_model.dart';
import 'package:se7ety/features/intro/welcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  var pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  LocalStorage.cacheData(
                      key: LocalStorage.isOnBoardingShown, value: true);
                  PushWithReplacement(context, WelcomeView());
                },
                child: Text(
                  'تخطي',
                  style: getBodyTextStyle(
                      color: AppColors.primaryColor, fontSize: 17),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        Spacer(),
                        SvgPicture.asset(
                          pages[index].image,
                          width: MediaQuery.sizeOf(context).width * .7,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                        Spacer(),
                        Text(
                          pages[index].title,
                          style: getBodyTextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Gap(20),
                        Text(
                          pages[index].body,
                          textAlign: TextAlign.center,
                          style: getBodyTextStyle(
                              color: AppColors.textColor, fontSize: 15),
                        ),
                        Spacer(
                          flex: 2,
                        )
                      ]);
                    }),
              ),
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: WormEffect(
                          dotHeight: 8,
                          dotWidth: 16,
                          activeDotColor: AppColors.primaryColor,
                          dotColor: AppColors.greyColor,
                          spacing: 8),
                    ),
                    Spacer(),
                    if (currentPage == 2)
                      CustomButton(
                          width: 120,
                          height: 45,
                          text: 'هيا بنا ',
                          onPressed: () {
                            LocalStorage.cacheData(
                                key: LocalStorage.isOnBoardingShown,
                                value: true);
                            PushWithReplacement(context, WelcomeView());
                          })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
