import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition/constants.dart';
import 'package:nutrition/models/Item.dart';
import 'package:nutrition/screens/details.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final int index;
  const ItemCard({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  DetailsScreen(item: item,),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
            top: index.isOdd ? 10 : 0, bottom: index.isOdd ? 0 : 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color(item.color!),
        ),
        child: Column(
          children: [
            Hero(
              tag: item.id!,
              child: Image.asset(
                item.image!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: kDefaultPadding * 0.8,
                // bottom: kDefaultPadding * 0.4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${item.name}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '\$ ${item.price}',
                        style: const TextStyle(
                          color: kRedColor,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/icons/heart.svg'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
