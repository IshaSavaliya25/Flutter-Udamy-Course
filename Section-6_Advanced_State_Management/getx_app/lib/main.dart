import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';
import 'screens/user_screen.dart';
import 'screens/data_screen.dart';
import 'services/api_service.dart';

void main() {
  // Injecting service globally
  Get.put(ApiService());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/user', page: () => UserScreen()),
        GetPage(name: '/data', page: () => DataScreen()),
      ],
    ),
  );
}
