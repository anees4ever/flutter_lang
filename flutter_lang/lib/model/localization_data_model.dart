class LocalizationDataModel {
  final int id;
  final String key;
  final Map<String, dynamic> values;
  final String description;

  LocalizationDataModel({
    required this.id,
    required this.key,
    required this.values,
    required this.description,
  });

  static fromJson(Map<String, dynamic> json) {
    return LocalizationDataModel(
      id: json['id'] ?? 0,
      key: json['key'] ?? '',
      values: json['values'] ?? {},
      description: json['description'] ?? '',
    );
  }

  static fromJsonList(List<dynamic> jsonList) {
    List<LocalizationDataModel> items = [];
    for (var item in jsonList) {
      items.add(fromJson(item));
    }
    return items;
  }
}
