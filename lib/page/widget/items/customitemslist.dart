import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/favoritecontroller.dart';
import 'package:mashwerni/controller/itemscontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/core/function/translatedatabase.dart';
import 'package:mashwerni/linkapi.dart';

class CustomItemsList extends GetView<ItemsControllerImp> {
  final int index;
  const CustomItemsList({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp);
    List revImages = controller.items[index].images!.reversed.toList();
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(controller.items[index]);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${controller.items[index].tripNum}",
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageItems}/${revImages[0]}",
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                translateDataBase(controller.items[index].titleAR!,
                    controller.items[index].title!),
                style: context.textTheme.titleMedium,
              ),
              Text(
                "${"by".tr} ${translateDataBase(controller.items[index].companyNameAr, controller.items[index].companyName)}",
                style: context.textTheme.titleSmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${controller.items[index].cost} ${"syp".tr}"),
                  GetBuilder<FavoriteControllerImp>(
                    builder: (favController) => IconButton(
                      icon: Icon(
                        favController.isFavorite[
                                    controller.items[index].tripNum] ==
                                1
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: AppColor.accent,
                      ),
                      onPressed: () {
                        if (favController
                                .isFavorite[controller.items[index].tripNum] ==
                            1) {
                          favController.setFavorite(
                              controller.items[index].tripNum!, 0);
                          favController
                              .removeFavorite(controller.items[index].tripNum!);
                        } else {
                          favController.setFavorite(
                              controller.items[index].tripNum!, 1);
                          favController
                              .addFavorite(controller.items[index].tripNum!);
                        }
                      },
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
