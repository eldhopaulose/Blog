import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app/constants/constants.dart';
import 'package:frontend/app/widgets/common_container.dart';
import 'package:frontend/app/widgets/common_text.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const assetName = 'assets/images/signin.svg';
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0.r,
                    right: 10.r,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: SizedBox(
                        height: 380.h,
                        width: 520.w,
                        child: SvgPicture.asset(
                          assetName,
                          semanticsLabel: 'A red up arrow',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(10).w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonText(
                            text: 'Login',
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
                          const CommonContainer(
                            height: 70,
                            width: double.infinity,
                            widget: Center(
                              child: TextField(
                                decoration: InputDecoration(
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
                              child: Obx(() => TextField(
                                    // controller: _passwordController,
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
                                  )),
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
                                  'SignIn',
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    letterSpacing: .5,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0).r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/signup');
                                  },
                                  child: CommonText(
                                    text: 'Register',
                                    style: GoogleFonts.roboto(
                                      color: primaryColor,
                                      fontSize: 15.sp,
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: CommonText(
                                    text: 'forgot password?',
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
      ),
    );
  }
}
