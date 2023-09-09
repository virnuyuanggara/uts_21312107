import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //Mengambil Data tidak secara realtime
  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference products = firestore.collection('products');

    return products.get();
  }
  //Mengambil Data secara realtime
    Stream<QuerySnapshot<Object?>> streamData() {
      CollectionReference products = firestore.collection('products');
      return products.snapshots();
    }

   void deleteProduct(String id) {
      DocumentReference docRef = firestore.collection("product").doc(id);

      try {
        Get.defaultDialog(
          title: "Info",
          middleText: "Apakah anda inhgin menghapus data ini ?",
          onConfirm: () {
            docRef.delete();
            Get.back();
          },
          textConfirm: "Ya",
          textCancel: "Batal",
        );
      } catch (e) {}
    }
  }