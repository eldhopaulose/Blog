import 'package:flutter/cupertino.dart';
import 'package:frontend/app/modules/register_details/views/register_details_view.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  final count = 0.obs;
  var pass = ''.obs;
  var confpass = ''.obs;
  final TextEditingController email = TextEditingController();

  var isPasswordValid = true.obs;

  var showPassword = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void validateConfirmPassword() {
    // Add your confirm password validation logic here
    // For example, check if it matches the password
    isPasswordValid.value = pass.value == confpass.value;
  }

  void nextPage(BuildContext context) {
    if (email.value.text.isNotEmpty && pass.value == confpass.value) {
      Get.to(RegisterDetailsView());
    } else {
      MotionToast.warning(
              title: Text("Fill all fields"),
              description: Text("This is a Warning"))
          .show(context);
    }
  }
}
