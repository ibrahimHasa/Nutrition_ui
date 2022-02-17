// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition/constants.dart';

PreferredSizeWidget buildAppBar(
  context, {
  String? title,
  List<Widget>? actions,
  Widget? leading,
  TextStyle? style,
}) {
  return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title!,
      ),
      titleTextStyle: style,
      centerTitle: true,
      leading: leading,
      actions: actions);
}

class NavItem extends StatelessWidget {
  final String? icon;
  final GestureTapCallback? tab;
  const NavItem({
    required this.icon,
    required this.tab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tab,
      child: SvgPicture.asset(
        icon!,
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      margin: const EdgeInsets.all(kDefaultPadding),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavItem(
            icon: 'assets/icons/home.svg',
            tab: () {},
          ),
          NavItem(
            icon: 'assets/icons/chat.svg',
            tab: () {},
          ),
          NavItem(
            icon: 'assets/icons/buy.svg',
            tab: () {},
          ),
          NavItem(
            icon: 'assets/icons/profile.svg',
            tab: () {},
          ),
        ],
      ),
    );
  }
}
