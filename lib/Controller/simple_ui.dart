import 'package:get/get.dart';

class SimpleUIController extends GetxController {
  var isLoading = false.obs;
  var isObscure = true.obs;

  void setLoading(bool value) {
    isLoading.value = value;
  }

  void isObscureActive() {
    isObscure.value = !isObscure.value;
  }
}