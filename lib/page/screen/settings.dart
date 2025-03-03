import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/settingscontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/core/constant/imageasset.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              height: Get.width / 3,
              color: AppColor.primary,
            ),
            Positioned(
              height: Get.width / 1.5,
              child: CircleAvatar(
                backgroundColor: AppColor.lightPrimary,
                radius: 40,
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage(AppImageAsset.avatar),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {},
                  title: Text("about us".tr),
                  trailing: Icon(Icons.info_outline),
                ),
                Divider(color: AppColor.divider),
                ListTile(
                  onTap: () {},
                  title: Text("contact us".tr),
                  trailing: Icon(Icons.contact_mail_outlined),
                ),
                Divider(color: AppColor.divider),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: Text("logout".tr),
                  trailing: Icon(Icons.logout),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
