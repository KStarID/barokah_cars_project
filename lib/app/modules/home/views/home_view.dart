import 'package:barokah_cars_project/app/modules/home/views/widgets/home_header.dart';
import 'package:barokah_cars_project/app/modules/home/views/widgets/promo_slider.dart';
import 'package:barokah_cars_project/app/modules/profile_screen/controllers/profile_screen_controller.dart';
import 'package:barokah_cars_project/utils/constants/image_strings.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child('cars');
  final ProfileScreenController profileScreenController = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BaroHomeHeader(),
                const SizedBox(height: 30,),
                Column(
                  children: [
                    Obx(() => Text(
                      "Hello, ${profileScreenController.name.value}",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: Colors.black),
                      ),
                    )),
                    const SizedBox(height: 5,),
                    Text(
                      "Selamat Datang di Barocars",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextField(
                        onChanged: controller.filterCars,
                        decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                      value: controller.filterCondition,
                      onChanged: (String? newValue) {
                        controller.toggleFilter();
                      },
                      underline: SizedBox(),
                      icon: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                        child: const Icon(FluentIcons.filter_20_regular, size: 32, color: Colors.white,),
                      ),
                      items: <String>['Semua', 'Baru', 'Bekas']
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                  
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: BaroPromoSlider(banners: [BaroImages.productBanners1, BaroImages.productBanners2, BaroImages.productBanners3, BaroImages.productBanners4, BaroImages.productBanners5],),
                ),
                  
                const SizedBox(height: 10,),
            
                // Car List
                Text(
                  "Car List",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 8,),
                Obx(() {
                  if (controller.filteredCars.isEmpty) {
                    return Center(child: Text('No cars found'));
                  }

                  // Data dibagi du bagian
                  int halfLength = (controller.filteredCars.length / 2).ceil();
                  List<Map<String, dynamic>> cars1 = controller.filteredCars.sublist(0, halfLength);
                  List<Map<String, dynamic>> cars2 = controller.filteredCars.sublist(halfLength);

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: cars1.map((car) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Center(
                                child: Container(
                                  width: double.infinity, // Mengatur lebar agar memenuhi ruang yang tersedia
                                  height: 170,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFFE82027),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: car['image'] != null
                                          ? Image.network(car['image'], width: 190, height: 80, fit: BoxFit.cover)
                                          : CircleAvatar(child: Icon(Icons.car_rental)),
                                      ),
                                      const SizedBox(width: 8),
                                                                            Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 4,),
                                              Text(car['model'] ?? 'Unknown', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                              Text(car['merk'] ?? 'Unknown', style: TextStyle(color: Colors.grey)),
                                            ],
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: car['kondisi'] == 'Bekas' ? Colors.blue : Colors.red,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              car['kondisi'] ?? 'Unknown', 
                                              style: TextStyle(
                                                color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Price: Rp${car['harga'] ?? 'N/A'}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Expanded(
                        child: Column(
                          children: cars2.map((car) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Center(
                                child: Container(
                                  width: double.infinity, // Mengatur lebar agar memenuhi ruang yang tersedia
                                  height: 170,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFFE82027),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: car['image'] != null
                                          ? Image.network(car['image'], width: 190, height: 80, fit: BoxFit.cover)
                                          : CircleAvatar(child: Icon(FluentIcons.vehicle_car_20_regular), backgroundColor: Color(0xFFE82027), foregroundColor: Colors.white,),
                                      ),
                                      const SizedBox(width: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 4),
                                              Text(car['model'] ?? 'Unknown', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                              Text(car['merk'] ?? 'Unknown', style: TextStyle(color: Colors.grey)),
                                            ],
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: car['kondisi'] == 'Bekas' ? Colors.blue : Colors.red,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              car['kondisi'] ?? 'Unknown', 
                                              style: TextStyle(
                                                color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Price: Rp${car['harga'] ?? 'N/A'}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
