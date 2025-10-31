import 'package:flutter/material.dart';
import '../../../core/barrel.dart';
import '../../navbar/navbar_controller.dart';
import 'catalogue_controller.dart';

class CatalogueScreen extends GetView<CatalogueController> {
  const CatalogueScreen({super.key});

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
            "Companies",
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
              SizedBox(height: 10),
              CustomSearchField(
                onChanged: (value) {
                  controller.searchQuery.value = value;
                },
              ),
              SizedBox(height: 10),
              Obx(() {
                if (controller.isLoading.value) {
                  return Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (controller.errorMessage.value.isNotEmpty) {
                  return Expanded(
                    child: Center(child: Text(controller.errorMessage.value,textAlign: textAlignCenter,)),
                  );
                }

                if (controller.filterCompanies.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        controller.searchQuery.value.isEmpty
                            ? "No companies available"
                            : "No matching companies found",
                      ),
                    ),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.filterCompanies.length,
                    itemBuilder: (context, index) {
                      final company = controller.filterCompanies[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ListTile(
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.viewProducts,
                              arguments: company,
                            );
                          },
                          contentPadding: EdgeInsets.zero,

                          leading: ProductImage(
                            cacheKey: company.companyId.toString(),
                            imageUrl: company.companyLogo ?? "",
                            width: 50,
                            height: 50,
                          ),
                          title: Text(
                            company.companyName ?? "",
                            style: context.bodySmallStyle!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
