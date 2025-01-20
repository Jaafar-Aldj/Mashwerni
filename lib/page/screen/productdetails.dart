import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/productdetailcontroller.dart';
import 'package:mashwerni/core/function/translatedatabase.dart';
import 'package:mashwerni/page/widget/productdetails/custombottomnavproductdetails.dart';
import 'package:mashwerni/page/widget/productdetails/customdestination.dart';
import 'package:mashwerni/page/widget/productdetails/custompriceandcount.dart';
import 'package:mashwerni/page/widget/productdetails/customtopproductdetails.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailControllerImp controller =
        Get.put(ProductDetailControllerImp());
    return Scaffold(
      bottomNavigationBar: CustomBottomNavProductDetails(
        onPressed: () {},
      ),
      body: ListView(
        children: [
          CustomTopProductDetails(),
          SizedBox(height: 70),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${translateDataBase(controller.itemsModel.titleAR, controller.itemsModel.title)}",
                  style: context.textTheme.displayLarge,
                ),
                SizedBox(height: 10),
                CustomPriceAndCount(onAdd: () {}, onRemove: () {}, count: "2"),
                SizedBox(height: 10),
                Text(
                  "${translateDataBase(controller.itemsModel.descriptionAR, controller.itemsModel.description)}",
                  style: context.textTheme.displayMedium,
                ),
                SizedBox(height: 10),
                Text(
                  "destination".tr,
                  style: context.textTheme.displayMedium,
                ),
                CustomDestination(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
