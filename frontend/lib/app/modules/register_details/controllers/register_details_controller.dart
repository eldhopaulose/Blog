import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';

class RegisterDetailsController extends GetxController {
  //TODO: Implement RegisterDetailsController

  final count = 0.obs;

  RxString imgUrl = ''.obs;

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

  Future<void> pickImageAndUpload(BuildContext context) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      MotionToast.warning(
              title: Text("No image selected"),
              description: Text("This is a Warning"))
          .show(context);
      return;
    }

    try {
      String uniqueFileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('profile');
      Reference referenceImageToUpload =
          referenceDirImages.child(uniqueFileName);

      await referenceImageToUpload.putFile(File(image.path));

      String imageUrl = await referenceImageToUpload.getDownloadURL();

      // Update the imgUrl variable with the uploaded image URL
      imgUrl.value = imageUrl;

      // Notify GetX that a variable has changed, so it updates the UI
    } catch (e) {
      MotionToast.error(
              title: Text("Error"), description: Text("Error uploading image"))
          .show(context);

      return;
    }
  }
}
