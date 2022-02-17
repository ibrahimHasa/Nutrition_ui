import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition/components/buy.dart';
import 'package:nutrition/components/ingredients.dart';
import 'package:nutrition/components/qty_counter.dart';
import 'package:nutrition/components/title_bar.dart';
import 'package:nutrition/components/vitamins.dart';
import 'package:nutrition/components/widgets.dart';
import 'package:nutrition/constants.dart';
import 'package:nutrition/controllers/cubit/app_cubit.dart';
import 'package:nutrition/models/Item.dart';

class DetailsScreen extends StatelessWidget {
  final Item item;

  const DetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AppCubit(),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'Details',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
          leading: Transform.translate(
            offset: const Offset(
              kDefaultPadding * 0.5,
              0,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                'assets/icons/back.svg',
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/notification.svg',
              ),
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * 0.2),
              padding: EdgeInsets.only(top: size.height * 0.2),
              height: size.height * 0.8,
              // width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(item.color!),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 5),
                    topRight: Radius.circular(kDefaultPadding * 5),
                  )),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(
                    kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleBar(item: item),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      const QtyCounter(),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Text(
                        item.description!,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Vitamins(
                        item: item,
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      const Text(
                        'Ingredients',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Ingredients(item: item),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Buy(item: item),
                    ],
                  ),
                ),
              ),
            ),
            Hero(
              tag: item.id!,
              child: Image.asset(
                item.image!,
                height: size.height * 0.4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
