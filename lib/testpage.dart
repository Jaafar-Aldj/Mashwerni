import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/testcontroller.dart';
import 'package:mashwerni/core/class/statusrequest.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: GetBuilder<TestController>(builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return Center(
            child: Text("loading"),
          );
        } else if (controller.statusRequest == StatusRequest.offlinefailure) {
          return Center(
            child: Text("Offline Failure"),
          );
        } else if (controller.statusRequest == StatusRequest.serverFailure) {
          return Center(
            child: Text("Server Failure"),
          );
        } else {
          return ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return Text("${controller.data}");
            },
          );
        }
      }),
    );
  }
}
