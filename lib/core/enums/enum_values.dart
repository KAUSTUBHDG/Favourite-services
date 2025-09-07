class EnumValues<T> {
  EnumValues(this.map);
  Map<String, T> map;
  late Map<T, String> reverseMap;

  Map<T, String> get reverse {
    return map.map((String k, T v) => MapEntry<T, String>(v, k));
  }
}
