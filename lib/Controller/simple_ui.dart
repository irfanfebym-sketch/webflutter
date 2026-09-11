import 'package:get/get.dart';

class SimpleUIController extends GetxController {
  var isLoading = false.obs;

  void setLoading(bool value) {
    isLoading.value = value;
  }
}