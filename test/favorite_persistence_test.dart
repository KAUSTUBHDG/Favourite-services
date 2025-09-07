import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  testWidgets('Hive favorites persist in test box', (tester) async {
    await Hive.initFlutter();
    final box = await Hive.openBox('favorites_box');
    await box.put('favorite_ids', [1, 2, 3]);
    final raw = box.get('favorite_ids');
    expect(raw, isNotNull);
    expect(List.from(raw).contains(2), true);
    await box.clear();
    await box.close();
  });
}
