import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/homecontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/data/model/categoriesmodel.dart';
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
          return Categories(
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]));
        },
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const Categories({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            "${AppLink.imageCategories}/${categoriesModel.categoryImage}",
            colorFilter:
                ColorFilter.mode(AppColor.darkPrimary, BlendMode.srcIn),
          ),
        ),
        Text(
          "${categoriesModel.categoryName}",
          style: TextStyle(fontSize: 14, color: AppColor.primaryText),
        ),
      ],
    );
  }
}
