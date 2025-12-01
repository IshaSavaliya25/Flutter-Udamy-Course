import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/data_controller.dart';

class DataScreen extends StatelessWidget {
  final DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Data")),
      body: Center(
        child: Obx(
          () => controller.items.isEmpty
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.items
                      .map((item) => Text(item, style: TextStyle(fontSize: 20)))
                      .toList(),
                ),
        ),
      ),
    );
  }
}
