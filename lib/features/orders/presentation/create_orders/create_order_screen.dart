import 'package:flutter/material.dart';

import '../../../../core/barrel.dart';
import '../../../navbar/navbar_controller.dart';
import 'create_order_controller.dart';

class CreateOrderScreen extends GetView<CreateOrderController> {
  const CreateOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UnfocusWrapper(
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => controller.cartItems.isNotEmpty
              ? Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.dialog(
                            ConfirmDialog(
                              title: "Clear All Orders",
                              content:
                                  "Are you sure you want to delete ALL orders? This cannot be undone.",
                              confirmText: "Delete All",
                              onConfirm: () async {
                                await controller.deleteAllOrder();
                              },
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          color: Colors.red,
                          child: Row(
                            mainAxisAlignment: mainAxisCenter,
                            children: [
                              Icon(Icons.close, color: Colors.white, size: 18),
                              SizedBox(width: 10),
                              Text(
                                "Cancel",
                                style: context.bodySmallStyle!.copyWith(
                                  color: AppColors.whiteTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.confirmOrder,
                            arguments: [
                              controller.cartItems,
                              controller.totalAmount.value,
                              controller.totalProducts.value,
                            ],
                          );
                        },
                        child: Container(
                          height: 50,
                          color: Colors.green,
                          child: Row(
                            mainAxisAlignment: mainAxisCenter,
                            children: [
                              Icon(Icons.done, color: Colors.white, size: 18),
                              SizedBox(width: 10),
                              Text(
                                "Checkout",
                                style: context.bodySmallStyle!.copyWith(
                                  color: AppColors.whiteTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox.shrink(),
        ),
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
            "Create New Order",
            style: context.bodyLargeStyle!.copyWith(
              color: AppColors.whiteTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.appPrimaryColor,
        ),
        body: Column(
          crossAxisAlignment: crossAxisStart,
          children: [
            // SizedBox(height: 10

            // ),

            // Padding(
            //   padding: screenPadding,
            //   child: SizedBox(
            //     height: 40,
            //     child: CustomSearchField(
            //       onChanged: (value) {
            //         controller.searchQuery.value = value;
            //       },
            //     ),
            //   ),
            // ),
            _buildOrdersList(context),

            SizedBox(height: 5),
            Container(
              padding: defaultPadding,
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(color: Color(0xffDED2FA)),
              child: Row(
                mainAxisAlignment: mainAxisSpaceAround,
                children: [
                  Column(
                    crossAxisAlignment: crossAxisCenter,
                    mainAxisAlignment: mainAxisCenter,
                    children: [
                      Obx(
                        () => Text(
                          "${controller.totalProducts.value}",
                          style: context.headlineSmallStyle!.copyWith(
                            color: AppColors.blackTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Total Products",
                        style: context.displayLargeStyle!.copyWith(
                          color: AppColors.blackTextColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: crossAxisCenter,
                    mainAxisAlignment: mainAxisCenter,
                    children: [
                      Obx(
                        () => Text(
                          "Rs. ${controller.totalAmount.value == 0 ? 0 : context.formatPrice(controller.totalAmount.value)}",
                          style: context.headlineSmallStyle!.copyWith(
                            color: AppColors.blackTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Total Amount",
                        style: context.displayLargeStyle!.copyWith(
                          color: AppColors.blackTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            Padding(
              padding: screenPadding,
              child: SizedBox(
                height: 40,
                child: CustomSearchField(
                  hintText: "Select Companies",
                  onChanged: (value) {
                    controller.searchQuery.value = value;
                  },
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => controller.isCompanyLoading.value
                    ? Center(child: LoadingIndicator())
                    : controller.filterCompanies.isNotEmpty
                    ? ListView.builder(
                        padding: screenPadding,
                        itemCount: controller.filterCompanies.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(
                                  AppRoutes.selectProduct,
                                  arguments: [
                                    controller.filterCompanies[index],
                                    controller.totalAmount.value,
                                  ],
                                );
                              },
                              child: Row(
                                children: [
                                  ProductImage(
                                    imageUrl:
                                        controller
                                            .filterCompanies[index]
                                            .companyLogo ??
                                        "",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      controller
                                              .filterCompanies[index]
                                              .companyName ??
                                          "",
                                      style: context.bodySmallStyle!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(child: Text("Company not found!")),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersList(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.cartItems.isEmpty) {
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "Please, select company and add products.",
              style: context.bodySmallStyle,
            ),
          ),
        );
      }

      // Determine max height (e.g., 3 items x 100px = 300px max height)
      const double maxListHeight = 200;

      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: controller.cartItems.length > 3
              ? maxListHeight
              : double.infinity, // Let it grow naturally if <= 3
        ),
        child: ListView.builder(
          shrinkWrap: true,
          padding: screenPadding,
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            final order = controller.cartItems[index];

            return InkWell(
              onTap: () {
                Get.toNamed(
                  AppRoutes.selectProduct,
                  arguments: [order, controller.totalAmount.value],
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    ProductImage(
                      imageUrl: order.companyLogo,
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: crossAxisStart,
                        children: [
                          Text(
                            order.companyName,
                            style: context.bodySmallStyle!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: mainAxisStart,
                            children: [
                              Column(
                                crossAxisAlignment: crossAxisStart,
                                children: [
                                  Text(
                                    "#Products",
                                    style: context.displayLargeStyle!.copyWith(
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    order.totalProducts.toString(),
                                    style: context.displayLargeStyle!.copyWith(
                                      color: AppColors.blackTextColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: crossAxisStart,
                                children: [
                                  Text(
                                    "Company Total",
                                    style: context.displayLargeStyle!.copyWith(
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "Rs.${order.companyTotal == 0 ? 0 : context.formatPrice(order.companyTotal)}",
                                    style: context.displayLargeStyle!.copyWith(
                                      color: AppColors.blackTextColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
