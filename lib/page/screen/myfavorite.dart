import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/myfavoritecontroller.dart';
import 'package:mashwerni/core/class/handlingdataview.dart';
import 'package:mashwerni/page/widget/customappbar.dart';
import 'package:mashwerni/page/widget/myfavorite/customfavoriteitemslist.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return Container(
      padding: EdgeInsets.all(15),
      child: GetBuilder<MyFavoriteControllerImp>(
        builder: (controller) => ListView(
          children: [
            CustomAppBar(titleAppBar: "".tr),
            SizedBox(height: 20),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8),
                itemBuilder: (context, index) {
                  return CustomFavoriteItemsList(
                      itemsModel: controller.data[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
