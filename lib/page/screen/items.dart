import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/favoritecontroller.dart';
import 'package:mashwerni/controller/itemscontroller.dart';
import 'package:mashwerni/core/class/handlingdataview.dart';
import 'package:mashwerni/page/screen/home.dart';
import 'package:mashwerni/page/widget/customappbar.dart';
import 'package:mashwerni/page/widget/items/customitemscategorieslist.dart';
import 'package:mashwerni/page/widget/items/customitemslist.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteControllerImp favoriteController = Get.put(FavoriteControllerImp());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => ListView(
            children: [
              CustomAppBar(
                myController: controller.search,
                titleAppBar: "search for a trip".tr,
                iconOnPressed: () {},
                searchOnPressed: () {
                  controller.onSearch();
                },
                onChanged: (val) {
                  controller.checkSearch(val);
                },
              ),
              SizedBox(height: 10),
              controller.isSearch
                  ? ListSearchItems(listData: controller.searchDataModel)
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomItemsCategoriesList(),
                        HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.8),
                            itemCount: controller.items.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              favoriteController.setFavorite(
                                controller.items[index].tripNum!,
                                controller.items[index].favorite!,
                              );
                              return CustomItemsList(index: index);
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
