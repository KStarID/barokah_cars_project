import 'package:barokah_cars_project/app/modules/car_news/controllers/car_news_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CarNewsView extends GetView<CarNewsController> {
  const CarNewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BaroCars News'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          'Car News is Coming Soon',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
