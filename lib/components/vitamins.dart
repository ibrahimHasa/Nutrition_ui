import 'package:flutter/material.dart';
import 'package:nutrition/constants.dart';
import 'package:nutrition/models/Item.dart';

class Vitamins extends StatelessWidget {
  
  const Vitamins({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: item.vitamins!.length,
        itemBuilder: (context, index) {
          return Container(
            child: Text(
              item.vitamins![index],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultPadding),
              color: Colors.white,
            ),
            alignment: Alignment.center,
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.8),
            margin: const EdgeInsets.only(right: kDefaultPadding * 0.8),
          );
        },
      ),
    );
  }
}
