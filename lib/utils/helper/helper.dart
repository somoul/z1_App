import 'package:cloud_firestore/cloud_firestore.dart';

class FireHelper {
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  ///Collection Reference
  static CollectionReference settingCollectionReference =
      FirebaseFirestore.instance.collection("appSetting");
  static CollectionReference productCollectionApp =
      FirebaseFirestore.instance.collection("user");
  static CollectionReference sliderCollectionReference =
      FirebaseFirestore.instance.collection("homeSlider");
}

