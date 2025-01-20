import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/itemscontroller.dart';
import 'package:mashwerni/core/class/handlingdataview.dart';
import 'package:mashwerni/data/model/itemsmodel.dart';
import 'package:mashwerni/page/widget/customappbar.dart';
import 'package:mashwerni/page/widget/items/customitemscategorieslist.dart';
import 'package:mashwerni/page/widget/items/customitemslist.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => ListView(
            children: [
              CustomAppBar(
                titleAppBar: "",
                iconOnPressed: () {},
                searchOnPressed: () {},
              ),
              SizedBox(height: 10),
              CustomItemsCategoriesList(),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.8),
                  itemCount: controller.data.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomItemsList(
                      itemsModel: ItemsModel.fromJson(controller.data[index]),
                      active: false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
