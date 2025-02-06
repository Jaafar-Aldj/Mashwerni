import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/myfavoritecontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/core/function/translatedatabase.dart';
import 'package:mashwerni/data/model/myfavoritemodel.dart';
import 'package:mashwerni/linkapi.dart';

class CustomFavoriteItemsList extends GetView<MyFavoriteControllerImp> {
  final MyFavoriteModel itemsModel;
  const CustomFavoriteItemsList({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    List revImages = itemsModel.images!.reversed.toList();
    return InkWell(
      onTap: () {
        // controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${itemsModel.tripNum}",
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageItems}/${revImages[0]}",
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                translateDataBase(itemsModel.titleAr!, itemsModel.title!),
                style: context.textTheme.titleMedium,
              ),
              Text(
                "${"by".tr} ${translateDataBase(itemsModel.companyNameAr, itemsModel.companyName)}",
                style: context.textTheme.titleSmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${itemsModel.cost} ${"syp".tr}"),
                  IconButton(
                    onPressed: () {
                      controller.deleteFavorite(itemsModel.favoriteId!);
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      color: AppColor.primary,
                    ),
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
