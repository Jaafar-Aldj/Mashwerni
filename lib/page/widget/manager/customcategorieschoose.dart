import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/manager/addtripcontroller.dart';
import 'package:mashwerni/core/function/translatedatabase.dart';

class ManagerCustomCategoriesChoose extends GetView<AddTripControllerImp> {
  const ManagerCustomCategoriesChoose({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: controller.categories.length,
      itemBuilder: (context, index) {
        var category = controller.categories[index];
        return CheckboxListTile(
          title: Text(
              translateDataBase(category.categoryNameAr, category.categoryName)
                  as String),
          value: category.selected,
          onChanged: (value) {
            controller.selecteOnChange(value!, category);
          },
        );
      },
    );
  }
}
