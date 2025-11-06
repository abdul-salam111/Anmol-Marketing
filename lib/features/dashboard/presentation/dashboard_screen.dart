import 'package:anmol_marketing/features/dashboard/presentation/dashboard_controller.dart';
import 'package:flutter/material.dart';
import '../../../core/barrel.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: context.screenWidth > 400
                    ? context.screenHeight * 0.34
                    : context.screenHeight * 0.37,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff0D0367),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Column(
                    mainAxisAlignment: mainAxisEnd,

                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xff5020DA),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Obx(
                          () => Text(
                            controller.isLoading.value
                                ? "Loading"
                                : "Last Order",
                            style: context.bodySmallStyle!.copyWith(
                              color: AppColors.whiteTextColor,
                            ),
                          ),
                        ),
                      ),
                      context.heightBox(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Order Date
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order Date:',
                                style: context.bodySmallStyle!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4),
                              Obx(
                                () => Text(
                                  controller.isLoading.value
                                      ? ""
                                      : DateFormat('d, MMMM yyyy').format(
                                          controller
                                                  .getLastOrderModel
                                                  .value
                                                  .docDate ??
                                              DateTime.now(),
                                        ),
                                  style: context.bodySmallStyle!.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Amount
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Amount:',
                                style: context.bodySmallStyle!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4),
                              Obx(
                                () => Text(
                                  'Rs. ${controller.isLoading.value ? "" : context.formatPrice(controller.getLastOrderModel.value.amount)}',
                                  style: context.bodySmallStyle!.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Status
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Status:',
                                style: context.bodySmallStyle!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4),
                              Obx(
                                () => Text(
                                  controller.isLoading.value
                                      ? ""
                                      : controller
                                                .getLastOrderModel
                                                .value
                                                .status ??
                                            "",
                                  style: context.bodySmallStyle!.copyWith(
                                    color: Colors.green,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
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
              Align(
                alignment: topCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF4b00a7),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SizedBox(height: context.screenHeight * 0.04),

                      Text(
                        "Home",
                        style: context.bodyLargeStyle!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: context.screenWidth > 400
                            ? context.screenHeight * 0.019
                            : context.screenHeight * 0.005,
                      ),

                      Row(
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

                              errorWidget: (context, url, error) =>
                                  CachedNetworkImage(
                                    imageUrl: AppIcons.profiledefault2,
                                  ),
                              width: 85,
                              height: 85,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: crossAxisStart,
                              children: [
                                Text(
                                  '${SessionController().getUserDetails.customer?.customerName}',
                                  style: context.bodySmallStyle!.copyWith(
                                    color: AppColors.whiteTextColor,
                                  ),
                                ),
                                const SizedBox(height: 6),

                                Text(
                                  "Current Balance",
                                  style: context.displayLargeStyle!.copyWith(
                                    color: AppColors.darkGreyColor,
                                  ),
                                ),
                                Text(
                                  'Rs. ${context.formatPrice(SessionController().getUserDetails.customer!.balance!)}',
                                  style: context.headlineSmallStyle!.copyWith(
                                    color: AppColors.whiteTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          context.heightBox(context.screenHeight * 0.02),
          Expanded(
            child: GridView.builder(
              padding: screenPadding,
              itemCount: controller.cardItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: context.screenWidth > 400 ? 130 : 110,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final cardDetails = controller.cardItems[index];
                return InkWell(
                  onTap: cardDetails.onTap,
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardDetails.cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: mainAxisCenter,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white.withAlpha(
                              ((0.5) * 255).toInt(),
                            ),
                            child: Image.asset(
                              cardDetails.cardIcon,
                              width: 30,
                              height: 30,
                              color: cardDetails.textColor,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            cardDetails.cardName,
                            style: GoogleFonts.inter(
                              color: cardDetails.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
