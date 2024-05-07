import 'package:barokah_cars_project/app/modules/home/views/widgets/brand_card.dart';
import 'package:barokah_cars_project/app/modules/home/views/widgets/product_suggestions_card.dart';
import 'package:barokah_cars_project/utils/constants/image_strings.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6 ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchBar(
                  leading: Icon(FluentIcons.search_20_regular),
                  hintText: "Cari mobil yang kamu inginkan",
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                const SizedBox(height: 46,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Brands", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: Colors.black)),),
                    TextButton(
                      onPressed: (){}, 
                      child: Text("View all", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFE82027))),)),
                  ],
                ),
                const SizedBox(height: 16,),
                
                SizedBox(
                  height: 85,
                  width: double.infinity,
                  child: ListView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    children: const [
                      BrandCustomCard(brand: 'Toyota', stock: '12', image: BaroImages.toyota,),
                      SizedBox(width: 10,),
                      BrandCustomCard(brand: 'Nissan', stock: '8', image: BaroImages.nissan,),
                      SizedBox(width: 10,),
                      BrandCustomCard(brand: 'Mercedez', stock: '6', image: BaroImages.mercedezBenz,),
                      SizedBox(width: 10,),
                      BrandCustomCard(brand: 'Lexus', stock: '11', image: BaroImages.lexus,),
                      SizedBox(width: 10,),
                      BrandCustomCard(brand: 'Toyota', stock: '12', image: BaroImages.toyota,),
                      SizedBox(width: 10,),
                      BrandCustomCard(brand: 'Nissan', stock: '8', image: BaroImages.nissan,),
                      SizedBox(width: 10,),
                      BrandCustomCard(brand: 'Mercedez', stock: '6', image: BaroImages.mercedezBenz,),
                      SizedBox(width: 10,),
                      BrandCustomCard(brand: 'Lexus', stock: '11', image: BaroImages.lexus,),
                    ],
                  ),
                ),
                const SizedBox(height: 16,),

                Text("Offers", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: Colors.black)),),
                const SizedBox(height: 8,),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: const Color(0xFFE82027),),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 25,
                            height: 16,
                            child: Image(image: AssetImage(BaroImages.toyota))),
                          const SizedBox(width: 8,),
                          Text("2016 Toyota Avanza Veloz", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black)),)
                        ],
                      ),
                      const SizedBox(height: 35,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Rp288.700.000", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFFB0B0B0), decoration: TextDecoration.lineThrough)),),
                                  const SizedBox(width: 7,),
                                  Container(
                                    width: 25,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE82027),
                                      border: Border.all(color: const Color(0XFFE82027),),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text("5%", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFFF2F1F6)),), textAlign: TextAlign.center,),
                                  ),
                                ],
                              ),
                              Text("Rp274.265.000", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),),
                              const SizedBox(height: 10,),
                            ],
                          ),
                          const Image(image: AssetImage("assets/images/avanza.png")),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 12,),
                          const Icon(FluentIcons.timer_20_regular, size: 15,),
                          const SizedBox(width: 3,),
                          Text('12:30:15', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFFB0B0B0))),)
                        ],
                      ),
                    ],
                  ),
                  )
                ),
                const SizedBox(height: 32,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Suggestions", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: Colors.black)),),
                    TextButton(
                      onPressed: (){}, 
                      child: Text("View all", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFE82027))),)),
                  ],
                ),
                const SizedBox(height: 16,),
                
                SizedBox(
                  height: 108,
                  width: double.infinity,
                  child: ListView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    children: const [
                      ProductCustomCard(image: BaroImages.bmwM2, name: "BMW M2", price: "Rp1.767.000.000"),
                      SizedBox(width: 12,),
                      ProductCustomCard(image: BaroImages.fordMustang, name: "Ford Mustang 2018", price: "Rp2.850.000.000"),
                      SizedBox(width: 12,),
                      ProductCustomCard(image: BaroImages.toyotaCHR, name: "Toyota C-HR 2023", price: "Rp602.000.000"),
                    ],
                  ),
                ),
                const SizedBox(height: 28,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recent Visits", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: Colors.black)),),
                    TextButton(
                      onPressed: (){}, 
                      child: Text("View all", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFE82027))),)),
                  ],
                ),
                const SizedBox(height: 16,),
                
                SizedBox(
                  height: 108,
                  width: double.infinity,
                  child: ListView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    children: const [
                      ProductCustomCard(image: BaroImages.toyotaCHR, name: "Toyota C-HR 2023", price: "Rp1.767.000.000"),
                      SizedBox(width: 12,),
                      ProductCustomCard(image: BaroImages.bmwM2, name: "BMW M2", price: "Rp2.850.000.000"),
                      SizedBox(width: 12,),
                      ProductCustomCard(image: BaroImages.fordMustang, name: "Ford Mustang 2018", price: "Rp602.000.000"),
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}