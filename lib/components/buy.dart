import 'package:flutter/material.dart';
import 'package:nutrition/constants.dart';
import 'package:nutrition/models/Item.dart';

class Buy extends StatelessWidget {
  final Item item;
  const Buy({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const Text(
                'Price',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: '\$',
                      style: TextStyle(
                        color: kRedColor,
                        fontSize: 22,
                      ),
                    ),
                    TextSpan(
                      text: item.price.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      const  Expanded(
          flex: 4,
          child: BuyButton(
            
          ),
        ),
      ],
    );
  }
}

class BuyButton extends StatelessWidget {
  final Function()? tap;
  const BuyButton({
    Key? key,
    this.tap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultPadding * 2),
          color: kRedColor,
        ),
        height: 50,
        alignment: Alignment.center,
        child: const Text(
          'Buy Now',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
