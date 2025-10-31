// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import '../../../core/barrel.dart';
import '../../navbar/navbar_controller.dart';
import 'profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UnfocusWrapper(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          leading: Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.find<NavbarController>().currentIndex.value = 0;
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ],
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            "Profile",
            style: context.bodyLargeStyle!.copyWith(
              color: AppColors.whiteTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.appPrimaryColor,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: screenPadding,
              child: Column(
                children: [
                  SizedBox(height: context.screenHeight * 0.02),
                  Container(
                    height: context.screenHeight * 0.25,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: mainAxisCenter,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            imageUrl:
                                SessionController()
                                    .getUserDetails
                                    .customer
                                    ?.logo ??
                                '',
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                CachedNetworkImage(
                                  imageUrl: AppIcons.profiledefault,
                                ),
                            width: 80,
                            height: 80,
                          ),
                        ),
                        SizedBox(height: 10),

                        Text(
                          "${SessionController().getUserDetails.customer?.customerName}",
                          style: context.headlineSmallStyle!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Text(
                        //   "${ SessionController().getUserDetails.customer?.}",
                        //   style: context.bodySmallStyle!.copyWith(
                        //     color: AppColors.greyColor,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: padding20,
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: crossAxisStart,
                          children: [
                            Text(
                              "Change Password",
                              style: context.bodyMediumStyle!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),

                            CustomTextFormField(
                              controller: controller.newPassword,
                              labelColor: Colors.black,
                              obscureText: true,
                              labelfontSize: 14,
                              label: "New Password",
                              keyboardType: TextInputType.text,
                              borderColor: AppColors.lightGreyColor.withOpacity(
                                0.5,
                              ),

                              hintText: "Enter new password",
                              prefixIcon: Iconsax.lock,
                              validator: (lice) {
                                return Validator.validateRequired(
                                  lice,
                                  fieldName: "New Password",
                                );
                              },
                            ),
                            SizedBox(height: 15),
                            CustomTextFormField(
                              controller: controller.confirmPassword,
                              labelColor: Colors.black,
                              obscureText: true,
                              labelfontSize: 14,
                              label: "Confirm Password",
                              keyboardType: TextInputType.text,
                              borderColor: AppColors.lightGreyColor.withOpacity(
                                0.5,
                              ),

                              hintText: "Enter confirm password",
                              prefixIcon: Iconsax.lock,
                              validator: (lice) {
                                return Validator.validateRequired(
                                  lice,
                                  fieldName: "Confirm Password",
                                );
                              },
                            ),
                            SizedBox(height: 30),
                            SizedBox(
                              height: 45,
                              width: double.infinity,
                              child: Obx(
                                () => CustomButton(
                                  radius: 10,
                                  text: "Change Password",
                                  isLoading: controller.isLoading.value,
                                  onPressed: () async {
                                    if (controller.formKey.currentState!
                                            .validate() &&
                                        controller.confirmPassword.text ==
                                            controller.newPassword.text) {
                                      await controller.changePassword();
                                    } else if (controller.newPassword.text !=
                                        controller.confirmPassword.text) {
                                      AppToasts.showErrorToast(
                                        Get.context!,
                                        "Password not match",
                                      );
                                    }
                                  },
                                  backgroundColor: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: CustomButton(
                      radius: 10,
                      text: "Log Out",
                      onPressed: () async {
                        await controller.logoutUser();
                      },
                      backgroundColor: Colors.red,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
