import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/homecontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/core/function/translatedatabase.dart';
import 'package:mashwerni/data/model/itemsmodel.dart';
import 'package:mashwerni/linkapi.dart';

class CustomItemsListHome extends StatelessWidget {
  final List<ItemsModel> itemsList;
  const CustomItemsListHome({super.key, required this.itemsList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: itemsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Items(itemsModel: itemsList[index]);
        },
      ),
    );
  }
}

class Items extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageTripDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: CachedNetworkImage(
              imageUrl: "${AppLink.imageItems}/${itemsModel.images![0]}",
              height: 100,
              width: 150,
              fit: BoxFit.contain,
              color: AppColor.primaryText.withAlpha(70),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Positioned(
            top: 10,
            left: 30,
            child: Text(
              "${translateDataBase(itemsModel.titleAr, itemsModel.title)}",
              style: TextStyle(
                  color: AppColor.textAndIcon,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
