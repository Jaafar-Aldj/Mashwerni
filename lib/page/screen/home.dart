import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/homecontroller.dart';
import 'package:mashwerni/core/class/handlingdataview.dart';
import 'package:mashwerni/core/function/translatedatabase.dart';
import 'package:mashwerni/data/model/itemsmodel.dart';
import 'package:mashwerni/linkapi.dart';
import 'package:mashwerni/page/widget/customappbar.dart';
import 'package:mashwerni/page/widget/home/customcategorieslist.dart';
import 'package:mashwerni/page/widget/home/customhomecard.dart';
import 'package:mashwerni/page/widget/home/customitemslisthome.dart';
import 'package:mashwerni/page/widget/home/customtitlehome.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
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
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: controller.isSearch
                  ? ListSearchItems(listData: controller.searchDataModel)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomHomeCard(
                          title: "summer suprise".tr,
                          body: "cashback 20%".tr,
                        ),
                        CustomTitleHome(title: "categories".tr),
                        CustomCategoriesList(),
                        CustomTitleHome(title: "trips for you".tr),
                        CustomItemsListHome(),
                        CustomTitleHome(title: "offers".tr),
                        CustomItemsListHome(),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListSearchItems extends GetView<HomeControllerImp> {
  final List<ItemsModel> listData;
  const ListSearchItems({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToPageTripDetails(listData[index]);
          },
          child: Card(
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imageItems}/${listData[index].images![0]}"),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Text(translateDataBase(
                          listData[index].titleAr, listData[index].title)),
                      subtitle: Text(translateDataBase(
                          listData[index].categoryNameAr,
                          listData[index].categoryName)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
