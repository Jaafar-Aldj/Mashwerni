import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/profilecontroller.dart';
import 'package:mashwerni/core/class/handlingdataview.dart';
import 'package:mashwerni/core/constant/imageasset.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<ProfileController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(AppImageAsset.avatar),
                ),
                const SizedBox(height: 16),
                Text(
                  "${controller.user.fName!} ${controller.user.lName!}",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  controller.user.email!,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildProfileTile(
                            Icons.phone, "phone".tr, controller.user.phone!),
                        _buildProfileTile(Icons.location_on, "location".tr,
                            controller.user.location!),
                        _buildProfileTile(
                            Icons.calendar_today,
                            "trip duration you prefer".tr,
                            controller.user.tripLongFavorite!),
                      ],
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // يمكن تنفيذ منطق تعديل البيانات هنا
                    Get.snackbar("تنبيه", "ميزة التعديل ستتم إضافتها قريبًا!");
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text("Edit Profile"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileTile(IconData icon, String title, String value) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}
