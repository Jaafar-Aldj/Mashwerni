import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/itemscontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/core/function/translatedatabase.dart';
import 'package:mashwerni/data/model/itemsmodel.dart';
import 'package:mashwerni/linkapi.dart';

class CustomItemsList extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  const CustomItemsList({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl:
                    "${AppLink.imageItems}/${itemsModel.image5 ?? itemsModel.image4 ?? itemsModel.image3 ?? itemsModel.image2 ?? itemsModel.image1!}",
                height: 100,
                fit: BoxFit.contain,
              ),
              Text(
                translateDataBase(itemsModel.titleAR!, itemsModel.title!),
                style: context.textTheme.titleMedium,
              ),
              Text(
                "${"by".tr} ${itemsModel.companyName}",
                style: context.textTheme.titleSmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${itemsModel.cost} ${"syp".tr}"),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: AppColor.accent,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
