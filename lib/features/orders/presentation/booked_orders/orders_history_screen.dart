import 'package:flutter/material.dart';
import '../../../../core/barrel.dart';
import '../../../navbar/navbar_controller.dart';
import 'order_history_controller.dart';

class OrdersHistoryScreen extends GetView<OrderHistoryController> {
  const OrdersHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Order History",
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
          const SizedBox(height: 10),
          Padding(
            padding: screenPadding,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.dialog(_buildDateFilterPopup());
                  },
                  child: Icon(Iconsax.document_filter),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Obx(() {
                    final from = controller.formatDate(
                      controller.fromDate.value,
                    );
                    final to = controller.formatDate(controller.toDate.value);

                    return Text(
                      "Showing orders from $from to $to",
                      style: context.displayLargeStyle!.copyWith(
                        color: AppColors.blackTextColor,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "No",
                    style: context.bodySmallStyle!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Date",
                      style: context.bodySmallStyle!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Amount",
                    style: context.bodySmallStyle!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: context.screenWidth * 0.1),
                    child: Text(
                      "Status",
                      style: context.bodySmallStyle!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 20),
            child: Divider(height: 0, thickness: 2, color: Colors.black),
          ),

          Obx(
            () => controller.isLoading.value
                ? Expanded(child: Center(child: LoadingIndicator()))
                : controller.getAllOrdersList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: controller.getAllOrdersList.length,
                      itemBuilder: (context, index) {
                        final order = controller.getAllOrdersList[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 20,
                            right: 20,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "${order.orderId}",
                                  style: context.displayLargeStyle!,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Text(
                                    DateFormat(
                                      "dd-MMM-yyyy",
                                    ).format(order.docDate!).toString(),
                                    style: context.displayLargeStyle!,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3.0),
                                  child: Text(
                                    context.formatPrice(order.amount!),
                                    style: context.displayLargeStyle!,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      color: Colors.amber,

                                      padding: EdgeInsets.all(5),
                                      child: Center(
                                        child: Text(
                                          order.status
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains(
                                                    "delivery in process",
                                                  )
                                              ? "In Process"
                                              : "Recieved",
                                          style: context.displayMediumStyle!,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: Text(
                        "No orders history exist!",
                        style: context.bodySmallStyle,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateFilterPopup() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: crossAxisStart,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Filter Orders",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            const SizedBox(height: 20),
            Text(
              "From Date",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),

            Obx(
              () => GestureDetector(
                onTap: controller.pickFromDate,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: double.infinity,
                  child: Text(
                    controller.formatDate(controller.fromDate.value),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),
            Text(
              "To Date",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Obx(
              () => GestureDetector(
                onTap: controller.pickToDate,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: double.infinity,
                  child: Text(
                    controller.formatDate(controller.toDate.value),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Center(
              child: Row(
                mainAxisAlignment: mainAxisSpaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: CustomButton(
                      text: "Cancel",
                      fontsize: 13,
                      onPressed: () {
                        Get.back();
                      },
                      backgroundColor: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: CustomButton(
                      text: "Apply",
                      fontsize: 13,
                      onPressed: () {
                        Get.back();
                        controller.getAllOrders();
                      },
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
