import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_brand_controller.dart';

class AllBrandView extends GetView<AllBrandController> {
  const AllBrandView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllBrandView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AllBrandView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
