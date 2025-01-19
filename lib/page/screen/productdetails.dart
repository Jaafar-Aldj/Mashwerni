import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/productdetailcontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/linkapi.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailControllerImp controller =
        Get.put(ProductDetailControllerImp());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColor.lightPrimary,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(35),
                    ),
                  ),
                ),
                Center(
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imageItems}/${controller.itemsModel.image2}",
                    width: 250,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
