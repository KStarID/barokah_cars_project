import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigation_bar_controller.dart';

class NavigationBarView extends GetView<NavigationBarController> {
  const NavigationBarView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationBarController());
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 60,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: Colors.white,
            indicatorColor: Colors.white,
            indicatorShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  FluentIcons.home_20_regular,
                  size: 25,
                ),
                label: 'Home',
                selectedIcon: Icon(
                  FluentIcons.home_20_filled,
                  size: 28,
                  color: Color(0xFFE92027),
                ),
              ),
              NavigationDestination(
                icon: Icon(
                  FluentIcons.vehicle_car_20_regular,
                  size: 25,
                ),
                label: 'Seller',
                selectedIcon: Icon(FluentIcons.vehicle_car_20_filled,
                    size: 28, color: Color(0xFFE92027)),
              ),
              NavigationDestination(
                icon: Icon(
                  FluentIcons.receipt_20_regular,
                  size: 25,
                ),
                label: 'BaroNews',
                selectedIcon: Icon(FluentIcons.receipt_20_filled,
                    size: 28, color: Color(0xFFE92027)),
              ),
              NavigationDestination(
                icon: Icon(
                  FluentIcons.person_20_regular,
                  size: 25,
                ),
                label: 'Profile',
                selectedIcon: Icon(FluentIcons.person_20_filled,
                    size: 28, color: Color(0xFFE92027)),
              ),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
