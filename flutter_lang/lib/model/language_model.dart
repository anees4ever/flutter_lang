class LanguagesModel {
  final int id;
  final String name;
  final String code;

  LanguagesModel({required this.id, required this.name, required this.code});

  static fromJson(Map<String, dynamic> json) {
    return LanguagesModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      code: json['code'] ?? '',
    );
  }

  static fromJsonList(List<dynamic> jsonList) {
    List<LanguagesModel> items = [];
    for (var item in jsonList) {
      items.add(fromJson(item));
    }
    return items;
  }
}
