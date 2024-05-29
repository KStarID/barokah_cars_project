import 'package:barokah_cars_project/app/modules/home/controllers/home_controller.dart';
import 'package:barokah_cars_project/app/modules/home/views/widgets/circular_container.dart';
import 'package:barokah_cars_project/app/modules/home/views/widgets/promo_banner.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaroPromoSlider extends StatelessWidget {
  const BaroPromoSlider({
    super.key, 
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((url) => BaroRoundedImage(imageurl: url)).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
        
          )
        ),
        const SizedBox(height: 16,),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for(int i = 0; i < banners.length; i ++)
                BaroCircularContainer(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.carouselCurrentIndex.value == i ? const Color(0xFFE82027) : Colors.grey,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}