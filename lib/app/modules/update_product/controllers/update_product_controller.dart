import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cHarga;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("products").doc(id);
    return docRef.get();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNama = TextEditingController();
    cHarga = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    cNama.dispose();
    cHarga.dispose();
  }

  void updateProduct(String nama, String harga, String id) {
    CollectionReference products = firestore.collection("products");
    try {
      products.doc(id).update({
        "name": nama,
        "price": harga,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Data berhasil diedit!",
          onConfirm: () {
            cNama.clear();
            cHarga.clear();
            Get.back();
            Get.back();
          });
    } catch (e) {
      print(e);
    }
  }
}