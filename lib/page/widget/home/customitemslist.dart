import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/homecontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/data/model/itemsmodel.dart';
import 'package:mashwerni/linkapi.dart';

class CustomItemsList extends GetView<HomeControllerImp> {
  const CustomItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Items(
              itemsModel: ItemsModel.fromJson(controller.items[index]));
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            "${AppLink.imageItems}/${itemsModel.image1}",
            height: 100,
            width: 150,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColor.primaryText.withAlpha(70),
              borderRadius: BorderRadius.circular(30)),
          height: 120,
          width: 180,
        ),
        Positioned(
            left: 10,
            child: Text(
              "${itemsModel.title}",
              style: TextStyle(
                  color: AppColor.textAndIcon,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ))
      ],
    );
  }
}
