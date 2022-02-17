import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/constants.dart';
import 'package:nutrition/controllers/cubit/app_cubit.dart';

class QtyCounter extends StatelessWidget {
  const QtyCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          children: [
            const Text(
              'Details',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Spacer(),
            QtyButton(
              tap: () {
                AppCubit.get(context).decreaseCounter();
              },
              text: '-',
              size: 33,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '${AppCubit.get(context).counter}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            QtyButton(
              tap: () {
                AppCubit.get(context).increaseCounter();
              },
              text: '+',
              size: 23,
            ),
          ],
        );
      },
    );
  }
}

class QtyButton extends StatelessWidget {
  final String text;
  final GestureTapCallback tap;
  double? size;
  QtyButton({
    Key? key,
    required this.text,
    required this.tap,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultPadding * 0.5),
          color: Colors.white,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: kRedColor,
          ),
        ),
      ),
    );
  }
}
