import 'package:flutter/material.dart';

import '../../../core/barrel.dart';
import '../../categories/presentation/catalogue_controller.dart';
import '../../navbar/navbar_controller.dart';
import '../../orders/presentation/booked_orders/order_history_controller.dart';
import '../../orders/presentation/create_orders/create_order_controller.dart';

class DashboardController extends GetxController {
  final getLastOrderModel = GetLastOrderModel().obs;
  var isLoading = false.obs;

  Future<void> getLastOrder() async {
    try {
      isLoading.value = true;
      getLastOrderModel.value = await OrdersRepository.getLastOrder();
      isLoading.value = false;
    } on InvalidAppToken {
      isLoading.value = true;
      final response = await AuthRepository.loginUser(
        LoginUserModel(
          loginId: await storage.readValues(StorageKeys.phoneNumber),
          password: await storage.readValues(StorageKeys.password),
        ),
      );
      await SessionController().saveUserInStorage(response);
      await SessionController().getUserfromSharedpref();
      getLastOrderModel.value = await OrdersRepository.getLastOrder();
      isLoading.value = false;
    } catch (error) {
      isLoading.value = false;
    }
  }

  final NavbarController navbarController = Get.find<NavbarController>();

  late final List<CardModel> cardItems;

  @override
  void onInit() {
    super.onInit();
    getLastOrder();
    cardItems = [
      CardModel(
        cardColor: const Color(0xff7845EA).withAlpha(((0.2) * 255).toInt()),
        cardIcon: AppIcons.createorder,
        cardName: "Create Order",
        onTap: () {
          navbarController.currentIndex.value = 2;
          Get.find<CreateOrderController>().fetchCompanies();
        },
        textColor: const Color.fromARGB(255, 94, 29, 235),
      ),
      CardModel(
        cardColor: const Color(0xff2FC2AC).withAlpha(((0.2) * 255).toInt()),
        cardIcon: AppIcons.claimicon,
        cardName: "Expiry Claims",
        onTap: () {
          Get.toNamed(AppRoutes.expiryClaim);
        },
        textColor: Color.fromARGB(255, 35, 158, 140),
      ),
      CardModel(
        cardColor: const Color(0xffD88E46).withAlpha(((0.2) * 255).toInt()),
        cardIcon: AppIcons.myorders,
        cardName: "My Orders",
        onTap: () {
          navbarController.currentIndex.value = 3;
          Get.find<OrderHistoryController>().getAllOrders();
        },
        textColor: Color(0xffD88E46),
      ),
      CardModel(
        cardColor: const Color(0xff2593F4).withAlpha(((0.2) * 255).toInt()),
        cardIcon: AppIcons.profileicon,
        cardName: "My Profile",
        onTap: () {
          navbarController.currentIndex.value = 4;
        },
        textColor: const Color(0xff2593F4),
      ),
      CardModel(
        cardColor: const Color(0xff8FBC63).withAlpha(((0.2) * 255).toInt()),
        cardIcon: AppIcons.statementsicon,
        cardName: "A/C Statements",
        onTap: () {
          Get.toNamed(AppRoutes.acStatements);
        },
        textColor: Color.fromARGB(255, 97, 133, 60),
      ),
      CardModel(
        cardColor: const Color(0xffEA5545).withAlpha(((0.2) * 255).toInt()),
        cardIcon: AppIcons.catalogicon,
        cardName: "Product Catalog",
        onTap: () {
          navbarController.currentIndex.value = 1;
          Get.find<CatalogueController>().fetchCompanies();
        },
        textColor: const Color.fromARGB(255, 228, 72, 54),
      ),
    ];
  }
}

class CardModel {
  final Color cardColor;
  final String cardIcon;
  final String cardName;
  final VoidCallback onTap;
  final Color textColor;

  CardModel({
    required this.cardColor,
    required this.cardIcon,
    required this.cardName,
    required this.onTap,
    required this.textColor,
  });
}
