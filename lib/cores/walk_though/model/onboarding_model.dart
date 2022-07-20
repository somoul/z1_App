// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OnboardingModel {
  String? image;
  String? title;
  String? description;
  OnboardingModel({
    this.image,
    this.title,
    this.description,
  });

  OnboardingModel copyWith({
    String? image,
    String? title,
    String? description,
  }) {
    return OnboardingModel(
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'title': title,
      'description': description,
    };
  }

  factory OnboardingModel.fromMap(Map<String, dynamic> map) {
    return OnboardingModel(
      image: map['image'] != null ? map['image'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingModel.fromJson(String source) =>
      OnboardingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OnboardingModel(image: $image, title: $title, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OnboardingModel &&
        other.image == image &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => image.hashCode ^ title.hashCode ^ description.hashCode;
}
