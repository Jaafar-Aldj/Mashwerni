import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/itemscontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/core/function/translatedatabase.dart';

class CustomItemsCategoriesList extends GetView<ItemsControllerImp> {
  const CustomItemsCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Categories(
            catIndex: index,
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final int catIndex;
  const Categories({
    super.key,
    required this.catIndex,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(catIndex);
      },
      child: Center(
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => Container(
            padding: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 3,
                    color: controller.selectedCat == catIndex
                        ? AppColor.accent
                        : AppColor.darkPrimary),
              ),
            ),
            child: Text(
              "${translateDataBase(
                controller.categories[catIndex].categoryNameAr,
                controller.categories[catIndex].categoryName,
              )}",
              style: TextStyle(fontSize: 20, color: AppColor.primaryText),
            ),
          ),
        ),
      ),
    );
  }
}
