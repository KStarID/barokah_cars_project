import 'package:barokah_cars_project/app/modules/add_car/controllers/widgets/update_car_detail_controller.dart';
import 'package:barokah_cars_project/app/modules/navigation_bar/views/navigation_bar_view.dart';
import 'package:barokah_cars_project/utils/constants/colors.dart';
import 'package:barokah_cars_project/utils/constants/image_strings.dart';
import 'package:barokah_cars_project/utils/validators/validation.dart';
import 'package:barokah_cars_project/utils/widgets/widget_button.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BaroUpdateCarDetail extends StatefulWidget {
  const BaroUpdateCarDetail({super.key, required this.car});

  final Map<String, dynamic> car;

  @override
  _BaroUpdateCarDetailState createState() => _BaroUpdateCarDetailState();
}

class _BaroUpdateCarDetailState extends State<BaroUpdateCarDetail> {
  late UpdateCarDetailController updateCarDetailController;

  @override
  void initState() {
    super.initState();
    updateCarDetailController = Get.put(UpdateCarDetailController());
    updateCarDetailController.initializeWithCarData(widget.car);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaroColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                const Center(
                  child: Image(image: AssetImage(BaroImages.appLogo)),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Update Data",
                  style: GoogleFonts.plusJakartaSans(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Obx(() {
                            return updateCarDetailController.selectedImage.value == null &&
                                    updateCarDetailController.imageUrl.value.isEmpty
                                ? IconButton(
                                    icon: const Icon(
                                      FluentIcons.camera_switch_20_regular,
                                      size: 70,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      updateCarDetailController.getImage();
                                    },
                                  )
                                : MaterialButton(
                                    height: 100,
                                    child: updateCarDetailController.selectedImage.value !=
                                            null
                                        ? Image.file(
                                            updateCarDetailController.selectedImage.value!,
                                            fit: BoxFit.fill,
                                          )
                                        : Image.network(
                                            updateCarDetailController.imageUrl.value,
                                            fit: BoxFit.fill,
                                          ),
                                    onPressed: () {
                                      updateCarDetailController.getImage();
                                    },
                                  );
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // -- Merk
                      Text(
                        "Merk",
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: updateCarDetailController.merkController,
                        validator: (value) =>
                            BaroValidator.merkValidation(value),
                        decoration: InputDecoration(
                          hintText: "Contoh: Lexus",
                          hintStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB0B0B0)),
                          ),
                          labelText: "Merk",
                          labelStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB0B0B0)),
                          ),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE82027)),
                          ),
                        ),
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
                        controller: updateCarDetailController.modelController,
                        validator: (value) =>
                            BaroValidator.modelValidation(value),
                        decoration: InputDecoration(
                          hintText: 'Contoh: Ambulans',
                          hintStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB0B0B0)),
                          ),
                          labelText: "Model",
                          labelStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB0B0B0)),
                          ),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE82027)),
                          ),
                        ),
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
                        controller:
                            updateCarDetailController.tahunPembuatanController,
                        validator: (value) =>
                            BaroValidator.tahunPembuatanValidation(value),
                        decoration: InputDecoration(
                          hintText: 'Contoh: 2034',
                          hintStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB0B0B0)),
                          ),
                          labelText: "Tahun Pembuatan",
                          labelStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB0B0B0)),
                          ),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE82027)),
                          ),
                        ),
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
                            value: updateCarDetailController.kondisiValue.value,
                            onChanged: (newValue) {
                              updateCarDetailController.kondisiValue.value = newValue!;
                            },
                            items: ['Baru', 'Bekas']
                                .map<DropdownMenuItem<String>>(
                                    (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
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
                            value: updateCarDetailController.bahanBakarValue.value,
                            onChanged: (newValue) {
                              updateCarDetailController.bahanBakarValue.value =
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
                            }).toList(),
                          ),
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
                            value: updateCarDetailController.transmisiValue.value,
                            onChanged: (newValue) {
                              updateCarDetailController.transmisiValue.value = newValue!;
                            },
                            items: ['Manual', 'Matic']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
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
                        controller: updateCarDetailController.warnaController,
                        validator: (value) =>
                            BaroValidator.warnaValidation(value),
                        decoration: InputDecoration(
                          hintText: 'Contoh: Merah',
                          hintStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB0B0B0)),
                          ),
                          labelText: "Warna",
                          labelStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB0B0B0)),
                          ),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE82027)),
                          ),
                        ),
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
                        controller: updateCarDetailController.hargaJualController,
                        validator: (value) =>
                            BaroValidator.hargaJualValidate(value),
                        decoration: InputDecoration(
                          labelText: "Harga Jual",
                          hintText: 'Contoh: 300.000.000',
                          hintStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB0B0B0)),
                          ),
                          labelStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB0B0B0)),
                          ),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE82027)),
                          ),
                        ),
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
                        controller: updateCarDetailController.narahubungController,
                        validator: (value) =>
                            BaroValidator.narahubungValidation(value),
                        decoration: InputDecoration(
                          hintText: 'Contoh: 082248696800',
                          hintStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB0B0B0)),
                          ),
                          labelText: "Kontak Whatsapp",
                          labelStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB0B0B0)),
                          ),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE82027)),
                          ),
                        ),
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
                        controller: updateCarDetailController.deskripsiController,
                        validator: (value) =>
                            BaroValidator.deskripsiValidation(value),
                        decoration: InputDecoration(
                          hintText: "Jika tidak ada cukup isi dengan '-'",
                          labelText: "Deskripsi Tambahan",
                          labelStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB0B0B0)),
                          ),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE82027)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                BaroWidgetButton(
                  buttonName: "Update",
                  onPressed: () async {
                    await updateCarDetailController.updateCarDetails(widget.car['key']);
                    Get.to(
                      () => const NavigationBarView(),
                      transition: Transition.fadeIn,
                      duration: const Duration(seconds: 1),
                    );
                    Get.snackbar(
                      'Update Cars Success',
                      'Mobil anda telah berhasil dirubah.',
                      colorText: Colors.white,
                      backgroundColor: const Color(0xFFE82027),
                    );
                  },
                  color: BaroColors.secondPrimaryColor,
                ),
                const SizedBox(
                  height: 25,
                ),
                BaroWidgetButton(
                  buttonName: "Kembali",
                  onPressed: () => Get.back(),
                  color: BaroColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
