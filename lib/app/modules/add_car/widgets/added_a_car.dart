import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/validators/validation.dart';
import '../../../utils/widgets/widget_button.dart';
import '../../home/home_controller.dart';
import '../../navigation_bar/navigation_bar_view.dart';
import '../../home/widgets/home_header.dart';
import '../add_car_controller.dart';

class AddCarWidget extends StatelessWidget {
  const AddCarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final addCarController = Get.put(AddCarController());
    return Scaffold(
      backgroundColor: BaroColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: (() => Get.back()),
                        icon: Icon(
                          FluentIcons.arrow_left_20_regular,
                          size: 30,
                          color: BaroColors.primaryColor,
                        )),
                    const SizedBox(
                      width: 16,
                    ),
                    const BaroHomeHeader(),
                  ],
                ),
                const SizedBox(
                  height: 36,
                ),
                Text(
                  BaroTexts.addNewCars,
                  style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: BaroColors.blackColor)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -- Upload image
                    Center(
                      child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Obx(() {
                            return addCarController.selectedImage.value == null
                                ? IconButton(
                                    icon: Icon(
                                      FluentIcons.camera_switch_20_regular,
                                      size: 70,
                                      color: BaroColors.blackColor,
                                    ),
                                    onPressed: () {
                                      addCarController.getImage();
                                    },
                                  )
                                : MaterialButton(
                                    height: 100,
                                    child: Image.file(
                                      addCarController.selectedImage.value!,
                                      fit: BoxFit.fill,
                                    ),
                                    onPressed: () {
                                      addCarController.getImage();
                                    });
                          })),
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    // -- Merk

                    Text(
                      BaroTexts.merk,
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: BaroColors.blackColor)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: addCarController.merkController,
                      validator: (value) => BaroValidator.merkValidation(value),
                      decoration: InputDecoration(
                          hintText: "Contoh: Lexus",
                          hintStyle: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: BaroColors.abuabuB0B0B0Color)),
                          labelText: "Merk",
                          labelStyle: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: BaroColors.abuabuB0B0B0Color)),
                          fillColor: BaroColors.abuabuF6F6F6Color,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: BaroColors.primaryColor))),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    // -- Model

                    Text(
                      "Model",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: addCarController.modelController,
                      validator: (value) =>
                          BaroValidator.modelValidation(value),
                      decoration: InputDecoration(
                          hintText: 'Contoh: Ambulans',
                          hintStyle: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFB0B0B0))),
                          labelText: "Model",
                          labelStyle: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFB0B0B0))),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xFFE82027)))),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    // --   Tahun Pembuatan

                    Text(
                      "Tahun Pembuatan",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: addCarController.tahunPembuatanController,
                      validator: (value) =>
                          BaroValidator.tahunPembuatanValidation(value),
                      decoration: InputDecoration(
                          hintText: 'Contoh: 2034',
                          hintStyle: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFB0B0B0))),
                          labelText: "Tahun Pembuatan",
                          labelStyle: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFB0B0B0))),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xFFE82027)))),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    // -- Kondisi
                    Text(
                      "Kondisi",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFF6F6F6),
                      ),
                      child: Obx(
                        () => DropdownButtonFormField<String>(
                            value: addCarController.kondisiValue.value,
                            onChanged: (newValue) {
                              addCarController.kondisiValue.value = newValue!;
                            },
                            items: ['Baru', 'Bekas']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()),
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    // -- Bahan Bakar
                    Text(
                      "Bahan Bakar",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFF6F6F6),
                      ),
                      child: Obx(
                        () => DropdownButtonFormField<String>(
                            value: addCarController.bahanBakarValue.value,
                            onChanged: (newValue) {
                              addCarController.bahanBakarValue.value =
                                  newValue!;
                            },
                            items: [
                              'Bensin (Gasoline)',
                              'Solar (Diesel)',
                              'Gas alam (CNG)',
                              'Listrik (Electricity)'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    // -- Transmisi

                    Text(
                      "Transmisi",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFF6F6F6),
                      ),
                      child: Obx(
                        () => DropdownButtonFormField<String>(
                            value: addCarController.transmisiValue.value,
                            onChanged: (newValue) {
                              addCarController.transmisiValue.value = newValue!;
                            },
                            items: ['Manual', 'Matic']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    // --   Warna

                    Text(
                      "Warna",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: addCarController.warnaController,
                      validator: (value) =>
                          BaroValidator.warnaValidation(value),
                      decoration: InputDecoration(
                          hintText: 'Contoh: Merah',
                          hintStyle: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFB0B0B0))),
                          labelText: "Warna",
                          labelStyle: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFB0B0B0))),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xFFE82027)))),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    // -- Harga Jual

                    Text(
                      "Harga Jual",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: addCarController.hargaJualController,
                      validator: (value) =>
                          BaroValidator.hargaJualValidate(value),
                      decoration: InputDecoration(
                          labelText: "Harga Jual",
                          hintText: 'Contoh: 300.000.000',
                          hintStyle: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFB0B0B0))),
                          labelStyle: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFB0B0B0))),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xFFE82027)))),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    // -- Contact Person
                    Text(
                      "Narahubung",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: addCarController.narahubungController,
                      validator: (value) =>
                          BaroValidator.narahubungValidation(value),
                      decoration: InputDecoration(
                          hintText: 'Contoh: 082248696800',
                          hintStyle: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFB0B0B0))),
                          labelText: "Kontak Whatsapp",
                          labelStyle: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFB0B0B0))),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xFFE82027)))),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    // -- Deskripsi

                    Text(
                      "Deskripsi Tambahan",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: addCarController.deskripsiController,
                      validator: (value) =>
                          BaroValidator.deskripsiValidation(value),
                      decoration: InputDecoration(
                          hintText: "Jika tidak ada cukup isi dengan '-'",
                          labelText: "Deskripsi Tambahan",
                          labelStyle: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFB0B0B0))),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xFFE82027)))),
                    ),
                    const SizedBox(
                      height: 60,
                    ),

                    // -- Button Add
                    BaroWidgetButton(
                      buttonName: "Tambahkan Mobil",
                      onPressed: () async {
                        await addCarController.uploadFile();
                        await Future.delayed(const Duration(seconds: 2));
                        addCarController.clearForm();
                        Get.find<HomeController>().loadCars();
                        Get.to(
                          () => const NavigationBarView(),
                          transition: Transition.fadeIn,
                          duration: const Duration(seconds: 1),
                        );
                        Get.snackbar(
                          'Add Cars Success',
                          'Mobil anda telah berhasil ditambahkan.',
                          colorText: Colors.white,
                          backgroundColor: const Color(0xFFE82027),
                        );
                      },
                      color: BaroColors.primaryColor,
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
