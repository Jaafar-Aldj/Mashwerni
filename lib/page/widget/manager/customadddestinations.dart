import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/manager/addtripcontroller.dart';
import 'package:mashwerni/core/function/validinput.dart';

class CustomAddDestinations extends StatelessWidget {
  const CustomAddDestinations({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddTripControllerImp());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Add Destinations",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        GetBuilder<AddTripControllerImp>(
          builder: (controller) => Column(
            children: [
              for (int i = 0; i < controller.destinations.length; i++)
                Column(
                  children: [
                    TextFormField(
                      textDirection: TextDirection.ltr,
                      validator: (val) {
                        return validInput(val!, 5, 50, 'name');
                      },
                      controller: controller.destinations[i]["english"],
                      decoration: InputDecoration(
                        labelText: "Destination ${i + 1} (English)",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      validator: (val) {
                        return validInput(val!, 5, 50, 'name');
                      },
                      controller: controller.destinations[i]["arabic"],
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        labelText: "Destination ${i + 1} (Arabic)",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Remove Button
                    if (controller.destinations.length > 1)
                      IconButton(
                        icon: Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: () => controller.removeDestination(i),
                      ),
                    Divider(),
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
    );
  }
}
