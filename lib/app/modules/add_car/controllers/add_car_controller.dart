import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCarController extends GetxController {
  final merkController = TextEditingController();
  final modelController = TextEditingController();
  final bahanBakarController = TextEditingController();
  final transmisiController = TextEditingController();
  final hargaJualController = TextEditingController();
  final narahubungController = TextEditingController();
  final deskripsiController = TextEditingController();
  final tahunPembuatanController = TextEditingController();
  final warnaController = TextEditingController();
  var transmisiValue = 'Manual'.obs;
  var bahanBakarValue = 'Bensin (Gasoline)'.obs;
  var kondisiValue = 'Baru'.obs;
}
