import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/homecontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/core/function/translatedatabase.dart';
import 'package:mashwerni/linkapi.dart';

class CustomCategoriesList extends GetView<HomeControllerImp> {
  const CustomCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Categories(catIndex: index);
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final int catIndex;
  const Categories({
    super.key,
    required this.catIndex,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, catIndex);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.lightPrimary,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${AppLink.imageCategories}/${controller.categories[catIndex].categoryImage}",
              colorFilter:
                  ColorFilter.mode(AppColor.darkPrimary, BlendMode.srcIn),
            ),
          ),
          Text(
            "${translateDataBase(controller.categories[catIndex].categoryNameAr, controller.categories[catIndex].categoryName)}",
            style: TextStyle(fontSize: 14, color: AppColor.primaryText),
          ),
        ],
      ),
    );
  }
}
