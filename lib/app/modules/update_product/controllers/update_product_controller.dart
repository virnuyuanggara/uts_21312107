import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cHarga;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

@override
void onInit() {
  // TODO: implement onInit
  cNama = TextEditingController();
  cHarga = TextEditingController();
  super.onInit();
}


}

