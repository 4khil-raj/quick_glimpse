import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GeminiModel {
  final String role;
  final List<GeminiPartModel> parts;
  GeminiModel({
    required this.parts,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  factory GeminiModel.fromMap(Map<String, dynamic> map) {
    return GeminiModel(
      role: map['role'] as String,
      parts: List<GeminiPartModel>.from(
        (map['parts'] as List<int>).map<GeminiPartModel>(
          (x) => GeminiPartModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GeminiModel.fromJson(String source) =>
      GeminiModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class GeminiPartModel {
  final String text;
  GeminiPartModel({
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }

  factory GeminiPartModel.fromMap(Map<String, dynamic> map) {
    return GeminiPartModel(
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeminiPartModel.fromJson(String source) =>
      GeminiPartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
