import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/tripdetailcontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/linkapi.dart';

class CustomTopProductDetails extends GetView<TripDetailControllerImp> {
  const CustomTopProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: AppColor.lightPrimary,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),
        ),
        Positioned(
          top: 100,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
            tag: "${controller.itemsModel.tripNum}",
            child: SizedBox(
              width: 250,
              height: 160,
              child: CarouselSlider.builder(
                itemCount: controller.itemsModel.images?.length ?? 0,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imageItems}/${controller.itemsModel.images![index]}",
                    fit: BoxFit.contain,
                  );
                },
                options: CarouselOptions(
                  height: 160,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                ),
              ),
              // PageView.builder(
              //   itemCount: controller.itemsModel.images?.length ?? 0,
              //   itemBuilder: (context, index) {
              //     return CachedNetworkImage(
              //       imageUrl:
              //           "${AppLink.imageItems}/${controller.itemsModel.images![index]}",
              //       fit: BoxFit.contain,
              //     );
              //   },
              // ),
            ),
          ),
        )
      ],
    );
  }
}
