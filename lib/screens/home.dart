// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition/components/categories.dart';
import 'package:nutrition/components/components.dart';
import 'package:nutrition/components/filter_button.dart';
import 'package:nutrition/components/item_card.dart';
import 'package:nutrition/components/widgets.dart';
import 'package:nutrition/constants.dart';
import 'package:nutrition/controllers/cubit/app_cubit.dart';
import 'package:nutrition/models/Item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // ignore: todo
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: buildAppBar(
              context,
              title: '',
              leading: Transform.translate(
                offset: const Offset(
                  kDefaultPadding * 0.5,
                  0,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/user.png',
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
            bottomNavigationBar: const BottomNavBar(),
            body: SingleChildScrollView(
              physics:const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(kDefaultPadding),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'find the best\nHealth For You',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    const SearchBar(),
                    Row(
                      children: const [
                        FilterButton(),
                        Expanded(
                          child: Categories(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    const Text(
                      'Popular',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    MasonryGridView.count(
                      itemCount: demoItems.length,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ItemCard(
                          item: demoItems[index],
                          index: index,
                        );
                      },
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
