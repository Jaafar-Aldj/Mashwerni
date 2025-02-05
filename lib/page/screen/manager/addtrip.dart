import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/manager/addtripcontroller.dart';
import 'package:mashwerni/core/class/handlingdataview.dart';
import 'package:mashwerni/core/function/validinput.dart';
import 'package:mashwerni/page/widget/auth/custombutton.dart';
import 'package:mashwerni/page/widget/auth/customtextform.dart';
import 'package:mashwerni/page/widget/auth/customtexttitle.dart';
import 'package:mashwerni/page/widget/manager/customadddestinations.dart';
import 'package:mashwerni/page/widget/manager/customcategorieschoose.dart';
import 'package:mashwerni/page/widget/manager/customdatechoose.dart';
import 'package:mashwerni/page/widget/manager/custompassengerslider.dart';
import 'package:mashwerni/page/widget/manager/customtriplongchoose.dart';

class AddTrip extends StatelessWidget {
  const AddTrip({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddTripControllerImp());
    return GetBuilder<AddTripControllerImp>(
      builder: (controller) => HandlingDataRequest(
        statusRequest: controller.statusRequest,
        widget: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              CustomTextTitleAuth(title: "add your trip".tr),
              SizedBox(height: 20),
              Form(
                key: controller.key,
                child: Column(
                  children: [
                    CustomTextForm(
                      isNumber: false,
                      hintText: "enter title in english".tr,
                      labelText: "title".tr,
                      iconData: Icons.text_fields,
                      myController: controller.title,
                      valid: (val) {
                        return validInput(val!, 1, 100, "name");
                      },
                    ),
                    CustomTextForm(
                      isNumber: false,
                      arabic: true,
                      hintText: "enter title in arabic".tr,
                      labelText: "title".tr,
                      iconData: Icons.text_fields,
                      myController: controller.titleAr,
                      valid: (val) {
                        return validInput(val!, 1, 100, "name");
                      },
                    ),
                    CustomTextForm(
                      isNumber: false,
                      hintText: "enter description in english".tr,
                      labelText: "description".tr,
                      iconData: Icons.text_fields,
                      myController: controller.description,
                      valid: (val) {
                        return validInput(val!, 5, 3000, "name");
                      },
                    ),
                    CustomTextForm(
                      isNumber: false,
                      arabic: true,
                      hintText: "enter description in arabic".tr,
                      labelText: "description".tr,
                      iconData: Icons.text_fields,
                      myController: controller.descriptionAr,
                      valid: (val) {
                        return validInput(val!, 5, 3000, "name");
                      },
                    ),
                    CustomTextForm(
                      isNumber: false,
                      hintText: "enter start location in english".tr,
                      labelText: "start location".tr,
                      iconData: Icons.location_city,
                      myController: controller.startLocation,
                      valid: (val) {
                        return validInput(val!, 3, 50, "name");
                      },
                    ),
                    CustomTextForm(
                      isNumber: false,
                      arabic: true,
                      hintText: "enter start location in arabic".tr,
                      labelText: "start location".tr,
                      iconData: Icons.location_city,
                      myController: controller.startLocationAr,
                      valid: (val) {
                        return validInput(val!, 3, 50, "name");
                      },
                    ),
                    CustomTextForm(
                      hintText: "enter the price in syp".tr,
                      labelText: "cost".tr,
                      iconData: Icons.attach_money,
                      myController: controller.cost,
                      valid: (val) {
                        return validInput(val!, 1, 16, 'number');
                      },
                      isNumber: true,
                      onChanged: (val) {
                        controller.costChange(val);
                      },
                    ),
                    SizedBox(height: 20),
                    CustomAddDestinations(),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CustomDateChoose(text: "choose a start date".tr),
              SizedBox(height: 20),
              ManagerCustomTripLongChoose(),
              ManagerCustomCategoriesChoose(),
              CustomPassengerSlider(),
              CustomButtonAuth(
                text: "confirm".tr,
                onPressed: () {
                  controller.addTrip();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
