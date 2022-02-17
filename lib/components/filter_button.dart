import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition/constants.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.4),
          margin: const EdgeInsets.only(right: kDefaultPadding * 0.5),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/filter.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
