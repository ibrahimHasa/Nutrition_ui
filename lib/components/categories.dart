import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition/constants.dart';
import 'package:nutrition/controllers/cubit/app_cubit.dart';
import 'package:nutrition/models/Category.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kDefaultPadding,
      ),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return BlocConsumer<AppCubit, AppStates>(
              listener: (context, state) {
                // ignore: todo
                // TODO: implement listener
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    AppCubit.get(context).changeCategoryFont(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 0.8),
                    margin: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 0.5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('${demoCategories[index].icon}'),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${demoCategories[index].name}',
                          style: TextStyle(
                            fontSize:
                                AppCubit.get(context).selectedIndex == index
                                    ? 18
                                    : 14,
                            color: kPrimaryColor,
                            fontWeight:
                                AppCubit.get(context).selectedIndex == index
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          itemCount: demoCategories.length,
        ),
      ),
    );
  }
}