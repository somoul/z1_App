// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BHanny {
  String? nameee;
  BHanny({
    this.nameee,
  });

  BHanny copyWith({
    String? nameee,
  }) {
    return BHanny(
      nameee: nameee ?? this.nameee,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameee': nameee,
    };
  }

  factory BHanny.fromMap(Map<String, dynamic> map) {
    return BHanny(
      nameee: map['nameee'] != null ? map['nameee'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BHanny.fromJson(String source) =>
      BHanny.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BHanny(nameee: $nameee)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BHanny && other.nameee == nameee;
  }

  @override
  int get hashCode => nameee.hashCode;
}
