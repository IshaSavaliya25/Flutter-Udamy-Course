import 'package:get/get.dart';

class User {
  var name = "".obs;
  var age = 0.obs;
}

class UserController extends GetxController {
  final user = User().obs;

  void updateUser(String newName, int newAge) {
    user.update((val) {
      val!.name.value = newName;
      val.age.value = newAge;
    });
  }
}
