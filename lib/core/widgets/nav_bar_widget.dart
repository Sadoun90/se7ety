
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:se7ety/core/constants/assetes_icons.dart';
import 'package:se7ety/core/utils/colors.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int selectedIndex = 0;

  List<Widget> pages = [
    // HomeView(),
    // WishlistView(),
    // CartView(),
    // ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value.toInt();
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetesIcons.homeSvg),
            activeIcon: SvgPicture.asset(
              AssetesIcons.homeSvg,
              colorFilter:
                  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              color: AppColors.primaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetesIcons.bookmarktSvg),
            activeIcon: SvgPicture.asset(
              AssetesIcons.bookmarktSvg,
              colorFilter:
                  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              color: AppColors.primaryColor,
            ),
            label: 'Searth',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetesIcons.cartSvg),
            activeIcon: SvgPicture.asset(
              AssetesIcons.cartSvg,
              colorFilter:
                  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              color: AppColors.primaryColor,
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetesIcons.profiletSvg),
            activeIcon: SvgPicture.asset(
              AssetesIcons.profiletSvg,
              colorFilter:
                  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              color: AppColors.primaryColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
