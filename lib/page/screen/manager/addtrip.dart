import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/manager/addtripcontroller.dart';
import 'package:mashwerni/core/class/handlingdataview.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/core/function/validinput.dart';
import 'package:mashwerni/page/widget/auth/custombutton.dart';
import 'package:mashwerni/page/widget/auth/customtextform.dart';
import 'package:mashwerni/page/widget/auth/customtexttitle.dart';
import 'package:mashwerni/page/widget/manager/customcategorieschoose.dart';
import 'package:mashwerni/page/widget/manager/customtriplongchoose.dart';

class AddTrip extends StatelessWidget {
  const AddTrip({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddTripControllerImp());
    return GetBuilder<AddTripControllerImp>(
      builder: (controller) => HandlingDataRequest(
        statusRequest: controller.statusRequest,
        widget: Form(
          key: controller.key,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                CustomTextTitleAuth(title: "add your trip".tr),
                SizedBox(height: 20),
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
                    return validInput(val!, 5, 100, "name");
                  },
                ),
                CustomTextForm(
                  isNumber: false,
                  hintText: "enter start location in arabic".tr,
                  labelText: "start location".tr,
                  iconData: Icons.location_city,
                  myController: controller.startLocationAr,
                  valid: (val) {
                    return validInput(val!, 5, 100, "name");
                  },
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.date_range),
                  title: Text(
                    controller.startDate == null
                        ? "choose a start date".tr
                        : controller.startDate!
                            .toLocal()
                            .toString()
                            .split(' ')[0],
                  ),
                  trailing: Icon(Icons.calendar_today),
                  onTap: () {
                    controller.dateChoose(context);
                  },
                ),
                SizedBox(height: 20),
                Text(
                  "${"your trip duration is".tr} ${controller.durationText()}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ManagerCustomTripLongChoose(),
                Text(
                  "please choose 1 category".tr,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ManagerCustomCategoriesChoose(),
                SizedBox(height: 20),
                Text(
                  "enter trip cost".tr,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Add Destinations",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    GetBuilder<AddTripControllerImp>(
                      builder: (controller) => Column(
                        children: [
                          for (int i = 0;
                              i < controller.destinations.length;
                              i++)
                            Column(
                              children: [
                                // English Destination Input
                                TextFormField(
                                  controller: controller.destinations[i]
                                      ["english"],
                                  decoration: InputDecoration(
                                    labelText: "Destination ${i + 1} (English)",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 10),
                                // Arabic Destination Input
                                TextFormField(
                                  controller: controller.destinations[i]
                                      ["arabic"],
                                  textDirection: TextDirection
                                      .rtl, // Ensures Arabic is written correctly
                                  decoration: InputDecoration(
                                    labelText: "Destination ${i + 1} (Arabic)",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 10),
                                // Remove Button
                                if (controller.destinations.length > 1)
                                  IconButton(
                                    icon: Icon(Icons.remove_circle,
                                        color: Colors.red),
                                    onPressed: () =>
                                        controller.removeDestination(i),
                                  ),
                                Divider(), // Just for better UI separation
                              ],
                            ),
                          SizedBox(height: 10),
                          if (controller.destinations.length < 5)
                            ElevatedButton.icon(
                              icon: Icon(Icons.add),
                              label: Text("Add Destination"),
                              onPressed: () => controller.addDestination(),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  "عدد الركاب: ${controller.maxPassengers.toInt()}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Slider(
                  value: controller.maxPassengers.toDouble(),
                  min: 5,
                  max: 500,
                  divisions: 495,
                  inactiveColor: AppColor.lightPrimary,
                  activeColor: AppColor.darkPrimary,
                  label: "${controller.maxPassengers.toInt()}",
                  onChanged: (value) {
                    controller.maxPassengersChange(value);
                  },
                ),
                SizedBox(height: 20),
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
      ),
    );
  }
}
