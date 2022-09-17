// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, deprecated_member_use, invalid_use_of_protected_member, unused_local_variable
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../model/app_model/app_models.dart';
import 'package:path/path.dart';

class HomeController extends GetxController {
  final homeListModel = <HomeModel>[].obs;
  final listApp = HomeModel().obs;
  final isLoding = false.obs;
  final bree = ''.obs;
  final bree_token = ''.obs;
  final isLodingFileImage = false.obs;
  final imageApps = ''.obs;
  final picker = ImagePicker();
  final isSelecPassLinkImage = true.obs;
  final imagePassLinkImage = ''.obs;
  final isNameAppEditingController = false.obs;
  final isLinkAppEditingController = false.obs;
  final isColorAppEditingController = false.obs;
  final isImagePassLinkImage = false.obs;
  final isDetailApp = false.obs;
  final detailApp = ''.obs;
  String url = "";
  final nameimage = ''.obs;
  final isSelecOption = false.obs;
  final imageApp = ''.obs;
// detail Screen
  final indexAdddetaillsuccess = 1.obs;
   List<TextEditingController> successTextEditingController=[];
    List<TextEditingController> noSuccessTextEditingController=[];
     List<int> listIndexAdddetaillsuccess=[];

  FirebaseStorage storage = FirebaseStorage.instance;

  File? image;
  Future<File> getImage() async {
    UploadTask? uploadTask;
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      nameimage.value = basename(pickedFile.path);

      image = File(pickedFile.path);
    }

    update();
    return image!;
  }

  Future<String> getImageStorage(File fileImage) async {
    isLoding(true);
    isLodingFileImage(true);
    UploadTask? uploadTask;
    try {
      uploadTask = await storage
          .ref(nameimage.value)
          // .ref(fileName)
          .putFile(
            fileImage,
          )
          .then((value) async {
        // if(p.state == TaskState.success){
        debugPrint('=======Sucass  :$value');
        final imageUrl = await value.ref.getDownloadURL();
        imageApp.value = imageUrl;
        debugPrint('============ downloadToFile :${imageUrl}');

        // }
      });
    } on FirebaseException catch (error) {
      print(error);
    }
    return imageApp.value;
  }
}
