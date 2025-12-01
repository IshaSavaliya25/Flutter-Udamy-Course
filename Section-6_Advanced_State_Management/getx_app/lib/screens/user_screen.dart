import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';

class UserScreen extends StatelessWidget {
  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Info")),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Name: ${controller.user.value.name}",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                "Age: ${controller.user.value.age}",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => controller.updateUser("Isha Savaliya", 20),
                child: Text("Update User"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
