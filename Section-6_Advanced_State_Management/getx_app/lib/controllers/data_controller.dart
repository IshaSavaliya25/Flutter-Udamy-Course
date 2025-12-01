import 'package:get/get.dart';
import '../services/api_service.dart';

class DataController extends GetxController {
  final ApiService service = Get.find();
  var items = <String>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    items.value = await service.fetchItems();
  }
}
