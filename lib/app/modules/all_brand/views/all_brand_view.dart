import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_brand_controller.dart';

class AllBrandView extends GetView<AllBrandController> {
  const AllBrandView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllBrandView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllBrandView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
