import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/app/widgets/common_container.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/register_details_controller.dart';

class RegisterDetailsView extends GetView<RegisterDetailsController> {
  const RegisterDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(RegisterDetailsController());
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0).w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey[200],
                    radius: 80.0,
                    child: controller.imgUrl.isNotEmpty
                        ? ClipOval(
                            child: Image.network(
                              controller.imgUrl.value,
                              width: 160.0,
                              height: 160.0,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.black54,
                          ),
                  ),
                  Positioned(
                    bottom: 0.r,
                    right: 55.r,
                    child: IconButton(
                      onPressed: () {
                        controller.pickImageAndUpload(context);
                      },
                      icon: Icon(
                        Icons.add_a_photo,
                        size: 30,
                        color: controller.imgUrl.isNotEmpty
                            ? Colors.grey[200]
                            : Colors.grey[800],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CommonContainer(
              height: 70,
              width: double.infinity,
              widget: Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.person_pin,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CommonContainer(
              height: 150,
              width: double.infinity,
              widget: Center(
                child: TextField(
                  minLines: 1,
                  maxLines: 20,
                  decoration: InputDecoration(
                    hintText: 'Tell about your self!',
                    contentPadding: EdgeInsets.symmetric(vertical: 40.0),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      CupertinoIcons.doc_person_fill,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300.w,
              height: 50.h,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Register',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 15.sp,
                      letterSpacing: .5,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
