import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase1/feature/shop/models/product.dart';
import 'package:firebase1/feature/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ShopController extends GetxController {
  final titleCtr = TextEditingController();
  final descriptionCtr = TextEditingController();
  final priceCtr = TextEditingController();
  final sizesCtr = TextEditingController();
  final colorsCtr = TextEditingController();
  final storage = FirebaseStorage.instance;
  final db = FirebaseFirestore.instance.collection("products");
  Future<String> uploadImage(File image) async {
    String downloadURL = "";
    try {
      String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';
      log("file name = $fileName");
      await storage.ref(fileName).putFile(image);
      downloadURL = await storage.ref(fileName).getDownloadURL();
      log('File uploaded. Download URL: $downloadURL');
    } on FirebaseException catch (e) {
      log('Error occurred while uploading the file: $e');
    }
    return downloadURL;
  }

  Future<void> addProduct(File file) async {
    String allColor = colorsCtr.text.replaceAll(',', ' ');
    List<String> colors = allColor.split(' ');

    openLoading();

    await db
        .add(ProductModel(
                id: DateTime.now().microsecondsSinceEpoch,
                title: titleCtr.text,
                detail: descriptionCtr.text,
                price: double.parse(priceCtr.text),
                size: int.parse(sizesCtr.text),
                colors: colors,
                image: await uploadImage(file))
            .toJson())
        .whenComplete(() {
      titleCtr.text = "";
      descriptionCtr.text = "";
      priceCtr.text = "";
      sizesCtr.text = "";
      colorsCtr.text = "";
      closeLoading();
      Get.back();
      Get.back();
    });
    update();
  }

  Future<void> deleteProduct(String docId) async {
    openLoading();
    await db.doc(docId).delete().whenComplete(() {
      closeLoading();
      Get.back();
    });
  }

  Future<void> updateProduct(String docId,ProductModel product) async {
    openLoading();
    await db.doc(docId).update(product.toJson()).whenComplete(() {
      closeLoading();
      Get.back();
      Get.back();
    });
  }
}