import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app/constants/constants.dart';
import 'package:frontend/app/modules/register_details/views/register_details_view.dart';
import 'package:frontend/app/modules/signin/views/signin_view.dart';
import 'package:frontend/app/widgets/common_container.dart';
import 'package:frontend/app/widgets/common_text.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const assetName = 'assets/images/register.svg';
    final TextEditingController pass = TextEditingController();
    final TextEditingController confpass = TextEditingController();

    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0.r,
                  right: 10.r,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      height: 280.h,
                      width: 290.w,
                      child: SvgPicture.asset(
                        assetName,
                        semanticsLabel: 'A red up arrow',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 500.h,
                  child: Padding(
                    padding: const EdgeInsets.all(10).r,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonText(
                          text: 'Register',
                          style: GoogleFonts.roboto(
                            color: primaryColor,
                            fontSize: 30.sp,
                            letterSpacing: .5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CommonContainer(
                          height: 70,
                          width: double.infinity,
                          widget: Center(
                            child: TextField(
                              controller: controller.email,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CommonContainer(
                          height: 70,
                          width: double.infinity,
                          widget: Center(
                            child: Obx(
                              () => TextField(
                                obscureText: !controller.showPassword.value,
                                controller: pass,
                                onChanged: (value) {
                                  controller.pass.value = value;
                                  controller.validateConfirmPassword();
                                },
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      controller.showPassword.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      controller.showPassword.toggle();
                                    },
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CommonContainer(
                          height: 70,
                          width: double.infinity,
                          widget: Center(
                            child: Obx(
                              () => TextField(
                                controller: confpass,
                                onChanged: (value) {
                                  controller.confpass.value = value;
                                  controller.validateConfirmPassword();
                                },
                                obscureText: !controller.showPassword.value,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      controller.showPassword.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      controller.showPassword.toggle();
                                    },
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          if (!controller.isPasswordValid.value) {
                            return SizedBox(
                                width: 320.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: '\u26A0 Password Incorrect.',
                                      style: GoogleFonts.roboto(
                                        color: Colors.redAccent,
                                        fontSize: 15.sp,
                                        letterSpacing: .5,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ));
                          } else {
                            return const SizedBox.shrink();
                          }
                        }),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 300.w,
                          height: 50.h,
                          child: ElevatedButton(
                              onPressed: () {
                                controller.nextPage(context);
                              },
                              child: Text(
                                'Next',
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  letterSpacing: .5,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0).r,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.off(const SigninView());
                                },
                                child: CommonText(
                                  text: 'I have already account ?',
                                  style: GoogleFonts.roboto(
                                    color: primaryColor,
                                    fontSize: 15.sp,
                                    letterSpacing: .5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
