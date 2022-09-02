// ignore_for_file: non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_models.freezed.dart';
part 'app_models.g.dart';

@freezed
class HomeModel with _$HomeModel {
  factory HomeModel({
    String? app_name,
    String? app_link,
    String? link_image,
    String? app_color,
    bool?  isUser,
  
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
}
