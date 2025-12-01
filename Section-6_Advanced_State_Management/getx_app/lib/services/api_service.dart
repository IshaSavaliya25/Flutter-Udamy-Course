class ApiService {
  Future<List<String>> fetchItems() async {
    await Future.delayed(Duration(seconds: 2));
    return ["Apple", "Banana", "Mango"];
  }
}
