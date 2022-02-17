import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition/constants.dart';
import 'package:nutrition/models/Item.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name!,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset('assets/icons/star.svg'),
                Text(
                  ' (${item.ratingCount})',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            )
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/heart.svg',
            color: kRedColor,
          ),
        )
      ],
    );
  }
}