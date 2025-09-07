import 'package:hive/hive.dart';

class ServicesLocalDataSource {
  final Box _box;
  static const String _favoritesKey = 'favorite_ids';

  ServicesLocalDataSource() : _box = Hive.box('favorites_box');

  Set<int> getFavoriteIds() {
    final raw = _box.get(_favoritesKey);
    if (raw == null) return <int>{};
    return (List.from(raw)).cast<int>().toSet();
  }

  Future<void> toggleFavorite(int id) async {
    final ids = getFavoriteIds();
    if (ids.contains(id)) {
      ids.remove(id);
    } else {
      ids.add(id);
    }
    await _box.put(_favoritesKey, ids.toList());
  }
}
