// ignore_for_file: deprecated_member_use
import 'package:anmol_marketing/core/core.dart';
import 'package:anmol_marketing/core/data/data.dart' hide ModelRow;
import 'package:anmol_marketing/features/products/presentation/view_products/view_products_controller.dart';
import 'package:anmol_marketing/core/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ViewProductsScreen extends GetView<ViewProductsController> {
  const ViewProductsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return UnfocusWrapper(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          leading: Row(
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back),
              ),
              CachedNetworkImage(
                imageUrl: controller.company.companyLogo ?? "",
                width: 40,
                height: 40,
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
        body: Padding(
          padding: screenPadding,
          child: Column(
            children: [
              const SizedBox(height: 10),
              CustomSearchField(onChanged: controller.searchProduct),
              const SizedBox(height: 10),
              Obx(
                () => controller.isLoading.value
                    ? LoadingIndicator()
                    :controller.products.isEmpty? Expanded(
                        child: Center(
                          child: Text(
                            "Products, not available",
                            style: context.bodySmallStyle,
                          ),
                        ),
                      ) : (controller.filteredProducts.isEmpty &&
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
                        child: Obx(() {
                          final products = controller.filteredProducts;
                          return GridView.builder(
                            itemCount: products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 12,
                                  childAspectRatio: 0.8,
                                ),
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return InkWell(
                                onTap: () {
                                  showProductDetails(context, product);
                                },
                                child: Container(
                                  padding: defaultPadding,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: AppColors.darkGreyColor.withAlpha(
                                        (0.6 * 255).toInt(),
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: crossAxisStart,
                                    children: [
                                      ProductImage(
                                        border: Border(),
                                        cacheKey: product.productId.toString(),
                                        imageUrl: product.productLogo!,
                                        width: context.screenWidth / 2,
                                        height: context.screenHeight * 0.15,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        product.productName!,
                                        maxLines: product.pack!.length > 7
                                            ? 1
                                            : 2,
                                        style: context.bodySmallStyle!.copyWith(
                                          color: AppColors.blackTextColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: textAlignCenter,
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        crossAxisAlignment: crossAxisEnd,
                                        mainAxisAlignment: mainAxisSpaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "T.p: ",
                                                style: context
                                                    .displayLargeStyle!
                                                    .copyWith(
                                                      color:
                                                          AppColors.greyColor,
                                                    ),
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                product.tradePrice.toString(),
                                                style: context
                                                    .displayLargeStyle!
                                                    .copyWith(
                                                      color: AppColors
                                                          .blackTextColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          if (product.pack!.length > 7)
                                            SizedBox(
                                              width:
                                                  80, // Adjust this based on your layout
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Pack:",
                                                    style: context
                                                        .displayLargeStyle!
                                                        .copyWith(
                                                          color: AppColors
                                                              .greyColor,
                                                        ),
                                                  ),
                                                  const SizedBox(height: 2),
                                                  Text(
                                                    product.pack!,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: context
                                                        .displayLargeStyle!
                                                        .copyWith(
                                                          color: AppColors
                                                              .blackTextColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          if (product.pack!.length < 6)
                                            Row(
                                              children: [
                                                Text(
                                                  "Pack:",
                                                  style: context
                                                      .displayLargeStyle!
                                                      .copyWith(
                                                        color: AppColors
                                                            .darkGreyColor,
                                                      ),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  product.pack!,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: context
                                                      .displayLargeStyle!
                                                      .copyWith(
                                                        color: AppColors
                                                            .blackTextColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showProductDetails(BuildContext context, GetProductsModel product) {
    showGeneralDialog(
      context: context,
      barrierLabel: product.productName,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),
      transitionBuilder: (_, anim, __, ___) {
        return Transform.scale(
          scale: anim.value,
          child: Opacity(
            opacity: anim.value,
            child: Center(
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.productName!,
                      style: context.bodyMediumStyle!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CachedNetworkImage(
                      imageUrl: product.productLogo!,
                      cacheKey: product.productId.toString(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Pack: ",
                              style: context.bodySmallStyle!.copyWith(
                                color: AppColors.darkGreyColor,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              product.pack!,
                              style: context.bodySmallStyle!.copyWith(
                                color: AppColors.blackTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "T.p: ",
                              style: context.bodySmallStyle!.copyWith(
                                color: AppColors.darkGreyColor,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              product.tradePrice.toString(),
                              style: context.bodySmallStyle!.copyWith(
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
            ),
          ),
        );
      },
    );
  }
}
