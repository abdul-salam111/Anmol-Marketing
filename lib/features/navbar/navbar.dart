// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../core/barrel.dart';
import '../categories/presentation/catalogue_controller.dart';
import '../categories/presentation/catalogue_screen.dart';
import '../dashboard/presentation/dashboard_screen.dart';
import '../orders/presentation/booked_orders/order_history_controller.dart';
import '../orders/presentation/booked_orders/orders_history_screen.dart';
import '../orders/presentation/create_orders/create_order_controller.dart';
import '../orders/presentation/create_orders/create_order_screen.dart';
import '../profile/presentation/profile_screen.dart';
import 'navbar_controller.dart';

class NavBarScreen extends GetView<NavbarController> {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: _handlePopInvoked,
      canPop: false,
      child: Scaffold(
        bottomNavigationBar: _buildBottomNavBar(),
        body: _buildContent(),
      ),
    );
  }

  void _handlePopInvoked(bool didPop) {
    Get.find<NavbarController>().currentIndex.value = 0;
  }

  Widget _buildBottomNavBar() {
    return Obx(
      () => Container(
        decoration: _navBarDecoration(),
        child: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: _handleNavItemTap,
          selectedItemColor: AppColors.appPrimaryColor,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          backgroundColor: AppColors.appLightThemeBackground,
          showSelectedLabels: false,
          items: _buildNavItems(),
        ),
      ),
    );
  }

  BoxDecoration _navBarDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 0,
          blurRadius: 2,
          offset: const Offset(0, -1), // Shadow above the navbar
        ),
      ],
    );
  }

  void _handleNavItemTap(int index) {
    controller.currentIndex.value = index;

    // Handle specific tab actions
    switch (index) {
      case 1:
        Get.find<CatalogueController>().fetchCompanies();
        break;
      case 2:
        Get.find<CreateOrderController>().fetchCompanies();
        break;
      case 3:
        Get.find<OrderHistoryController>().getAllOrders();
        break;
    }
  }

  List<BottomNavigationBarItem> _buildNavItems() {
    return [
      _buildNavItem(
        icon: AppIcons.homeEnabled,
        disabledIcon: AppIcons.homeDisabled,
        index: 0,
        label: AppConstants.homeTab,
      ),
      _buildNavItem(
        icon: AppIcons.categoryEnabled,
        disabledIcon: AppIcons.categoryDisabled,
        index: 1,
        label: AppConstants.categoryTab,
      ),
      _buildSpecialNavItem(
        icon: AppIcons.createOrder,
        index: 2,
        label: AppConstants.addOrderTab,
      ),
      _buildNavItem(icon: AppIcons.history, index: 3, label: AppConstants.historyTab),
      _buildNavItem(icon: AppIcons.profile, index: 4, label: AppConstants.profileTab),
    ];
  }

  BottomNavigationBarItem _buildNavItem({
    required String icon,
    String? disabledIcon,
    required int index,
    required String label,
  }) {
    final isActive = controller.currentIndex.value == index;
    final iconPath = isActive ? icon : (disabledIcon ?? icon);

    return BottomNavigationBarItem(
      icon: _buildNavIcon(iconPath, index),
      label: label,
    );
  }

  BottomNavigationBarItem _buildSpecialNavItem({
    required String icon,
    required int index,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: _buildNavIcon(icon, index, isSpecial: true),
      label: label,
    );
  }

  Widget _buildContent() {
    return Obx(
      () => IndexedStack(
        index: controller.currentIndex.value,
        children: const [
          DashboardScreen(),
          CatalogueScreen(),
          CreateOrderScreen(),
          OrdersHistoryScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }

  Widget _buildNavIcon(String icon, int index, {bool isSpecial = false}) {
    final isActive = controller.currentIndex.value == index;
    final iconColor = isActive || isSpecial
        ? AppColors.appPrimaryColor
        : Colors.grey;

    Widget iconWidget = Image.asset(
      icon,
      height: 25,
      width: 25,
      color: iconColor,
    );

    if (isSpecial) {
      iconWidget = Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.appLightThemeBackground,
          borderRadius: BorderRadius.circular(50),
        ),
        child: iconWidget,
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        iconWidget,
        const SizedBox(height: 4),
        if (isActive) _buildActiveIndicator(),
      ],
    );
  }

  Widget _buildActiveIndicator() {
    return Container(
      height: 2,
      width: 25,
      decoration: BoxDecoration(
        color: AppColors.appPrimaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
