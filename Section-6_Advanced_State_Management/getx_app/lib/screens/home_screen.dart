import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class HomeScreen extends StatelessWidget {
  final CounterController counter = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX App")),
      body: Center(
        child: Obx(
          () =>
              Text("Counter: ${counter.count}", style: TextStyle(fontSize: 28)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: counter.increment,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed('/user'),
              child: Text("Go to User Screen"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.toNamed('/data'),
              child: Text("Go to Data Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
