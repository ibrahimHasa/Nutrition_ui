
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition/constants.dart';
import 'package:nutrition/models/Item.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: item.ingrediants!.length,
        itemBuilder: (context, index) {
          return Container(
            child: SvgPicture.asset(
              item.ingrediants![index],
            ),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(kDefaultPadding),
              color: Colors.white,
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 0.8),
            margin: const EdgeInsets.only(
                right: kDefaultPadding * 0.8),
          );
        },
      ),
    );
  }
}
