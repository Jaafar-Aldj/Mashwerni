import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/profilecontroller.dart';
import 'package:mashwerni/core/class/handlingdataview.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GetBuilder<ProfileController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Column(
            children: [
              // صورة الملف الشخصي
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    AssetImage("assets/images/default_profile.png"),
                // يمكن تغيير الصورة لاحقًا بناءً على بيانات المستخدم
              ),
              const SizedBox(height: 16),

              // اسم المستخدم
              Text(
                "${controller.user[0].fName ?? ''} ${controller.user[0].lName ?? ''}",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // البريد الإلكتروني
              Text(
                controller.user[0].email ?? "No Email",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              // بيانات المستخدم في بطاقات
              Expanded(
                child: ListView(
                  children: [
                    _buildProfileTile(Icons.phone, "phone".tr,
                        controller.user[0].phone ?? "N/A"),
                    _buildProfileTile(Icons.location_on, "location".tr,
                        controller.user[0].location ?? "N/A"),
                    _buildProfileTile(
                        Icons.calendar_today,
                        "trip_long_favorite".tr,
                        controller.user[0].tripLongFavorite ?? "N/A"),
                    _buildProfileTile(Icons.person_outline, "account_id".tr,
                        controller.user[0].accountId.toString()),
                  ],
                ),
              ),

              // زر تعديل البيانات (اختياري)
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
