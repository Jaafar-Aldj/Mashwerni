import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/tripdetailcontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/linkapi.dart';

class CustomTopProductDetails extends GetView<TripDetailControllerImp> {
  const CustomTopProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
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
              child: PageView.builder(
                onPageChanged: (index) {
                  currentIndex = index;
                  controller.changeImage();
                },
                itemCount: controller.itemsModel.images?.length ?? 0,
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imageItems}/${controller.itemsModel.images![index]}",
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
          ),
        ),
        GetBuilder<TripDetailControllerImp>(
          builder: (controller) => Positioned(
            top: 50, // تحديد موقع النقاط
            left: Get.width / 8,
            right: Get.width / 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.itemsModel.images?.length ?? 0,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 8,
                  width:
                      currentIndex == index ? 12 : 8, // تغيير الحجم عند التحديد
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? AppColor.primary // اللون عند التحديد
                        : AppColor.secondryText, // اللون الافتراضي
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
