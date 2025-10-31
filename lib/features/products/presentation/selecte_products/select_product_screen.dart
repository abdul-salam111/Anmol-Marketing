import 'package:anmol_marketing/features/products/presentation/selecte_products/select_Product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/barrel.dart';

class SelectProductScreen extends GetView<SelectProductController> {
  const SelectProductScreen({super.key});

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
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              CachedNetworkImage(
                imageUrl: controller.company.companyLogo ?? "",
                width: 40,
                height: 40,

                errorWidget: (context, url, error) => Container(
                  width: 40,
                  height: 40,
                  color: Colors.grey[300],
                  child: Icon(Icons.error_outline, size: 20),
                ),
              ),
            ],
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            controller.company.companyName!,
            style: context.bodyLargeStyle!.copyWith(
              color: AppColors.whiteTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.appPrimaryColor,
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: screenPadding,
              child: CustomSearchField(
                onChanged: (value) {
                  controller.searchQuery(value);
                },
              ),
            ),
            SizedBox(height: 10),
            Obx(
              () => controller.isLoading.value
                  ? Expanded(child: LoadingIndicator())
                  : controller.products.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Text(
                          "Products, not available",
                          style: context.bodySmallStyle,
                        ),
                      ),
                    )
                  : (controller.filteredProducts.isEmpty &&
                        controller.products.isNotEmpty)
                  ? Expanded(
                      child: Center(
                        child: Text(
                          "The searched product is not available.",
                          style: context.bodySmallStyle,
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.separated(
                        padding: screenPadding,
                        itemCount: controller.filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product = controller.filteredProducts[index];
                          return InkWell(
                            onTap: () {
                              showProductDetailsBottomSheet(context, product);
                            },
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Row(
                                children: [
                                  ProductImage(
                                    imageUrl: product.productLogo!,
                                    cacheKey: product.productId.toString(),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          product.productName!,
                                          style: context.bodySmallStyle!
                                              .copyWith(
                                                color: AppColors.blackTextColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                          maxLines: 1,
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Text(
                                              "Pack: ",
                                              style: context.displayLargeStyle!
                                                  .copyWith(
                                                    color:
                                                        AppColors.darkGreyColor,
                                                  ),
                                            ),
                                            SizedBox(width: 3),
                                            Text(
                                              product.pack!,
                                              style: context.displayLargeStyle!
                                                  .copyWith(
                                                    color: AppColors
                                                        .blackTextColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Text(
                                              "Trade Price: ",
                                              style: context.displayLargeStyle!
                                                  .copyWith(
                                                    color:
                                                        AppColors.darkGreyColor,
                                                  ),
                                            ),
                                            SizedBox(width: 3),
                                            Text(
                                              "Rs. ${context.formatPrice(product.tradePrice!)}",
                                              style: context.displayLargeStyle!
                                                  .copyWith(
                                                    color: AppColors
                                                        .blackTextColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                      ],
                                    ),
                                  ),
                                  Obx(
                                    () => Container(
                                      padding: defaultPadding,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color:
                                              (controller.productQuantities[product] !=
                                                      null &&
                                                  controller
                                                          .productQuantities[product]! >
                                                      0)
                                              ? Colors.black
                                              : AppColors.greyColor,
                                          width:
                                              (controller.productQuantities[product] !=
                                                      null &&
                                                  controller
                                                          .productQuantities[product]! >
                                                      0)
                                              ? 2
                                              : 1,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        controller.productQuantities[product] ==
                                                null
                                            ? "Qty"
                                            : controller
                                                  .productQuantities[product]
                                                  .toString(),
                                        style: context.bodySmallStyle!.copyWith(
                                          color:
                                              (controller.productQuantities[product] !=
                                                      null &&
                                                  controller
                                                          .productQuantities[product]! >
                                                      0)
                                              ? Colors.black
                                              : AppColors.greyColor,
                                          fontWeight:
                                              (controller.productQuantities[product] !=
                                                      null &&
                                                  controller
                                                          .productQuantities[product]! >
                                                      0)
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(color: AppColors.darkGreyColor);
                        },
                      ),
                    ),
            ),
            Container(
              padding: padding14,
              height: 90,
              width: double.infinity,
              color: AppColors.appSecondaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Company Total",
                        style: context.bodySmallStyle!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Order Total",
                        style: context.bodyMediumStyle!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.appPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          "Rs. ${context.formatPrice(controller.companyTotal.value)}",
                          style: context.bodyMediumStyle!.copyWith(),
                        ),
                      ),
                      SizedBox(height: 10),
                      Obx(
                        () => Text(
                          "Rs. ${context.formatPrice(controller.totalAmount.value)}",
                          style: context.bodyMediumStyle!.copyWith(
                            color: AppColors.appPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SafeArea(
              child: InkWell(
                onTap: () async {
                  await controller.saveOrder();
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(color: AppColors.appPrimaryColor),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Iconsax.add_circle, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          "Add/Update",
                          style: context.bodyLargeStyle!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.appLightThemeBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showProductDetailsBottomSheet(
    BuildContext context,
    GetProductsModel product,
  ) {
    final int existingQty = controller.productQuantities[product] ?? 0;
    final TextEditingController quantityController = TextEditingController(
      text: existingQty > 0 ? existingQty.toString() : '',
    );
    final RxString errorText = ''.obs;
    final RxBool isValid = true.obs;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.productName ?? '',
                  style: context.bodyMediumStyle!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                CachedNetworkImage(
                  cacheKey: product.productId.toString(),
                  imageUrl: product.productLogo ?? '',
                  height: 150,

                  errorWidget: (context, url, error) => Container(
                    width: 40,
                    height: 40,
                    color: Colors.grey[300],
                    child: Icon(Icons.error_outline, size: 20),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Pack: ${product.pack}",
                      style: context.bodySmallStyle,
                    ),
                    Text(
                      "T.P: Rs. ${product.tradePrice}",
                      style: context.bodySmallStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Obx(
                  () => Column(
                    children: [
                      TextField(
                        autofocus: true,
                        controller: quantityController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (val) {
                          final int qty = int.tryParse(val.trim()) ?? 0;
                          if (qty > product.productStock!.toInt()) {
                            errorText.value = '';
                            isValid.value = true;
                          } else {
                            errorText.value = '';
                            isValid.value = true;
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          labelStyle: context.bodySmallStyle,
                          labelText: "Enter Quantity",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          errorText: errorText.value.isEmpty
                              ? null
                              : errorText.value,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 140,
                        child: ElevatedButton(
                          onPressed: () {
                            if (existingQty > 0) {
                              controller.updateProductQuantity(product, 0);
                              Get.back();
                            } else {
                              Get.back();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text(
                            existingQty > 0 ? "Remove" : "Cancel",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 140,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: isValid.value
                              ? () {
                                  final int quantity =
                                      int.tryParse(
                                        quantityController.text.trim(),
                                      ) ??
                                      0;
                                  controller.updateProductQuantity(
                                    product,
                                    quantity,
                                  );
                                  Get.back();
                                }
                              : null,
                          child: Text(
                            existingQty > 0 ? "Update" : "Add",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
