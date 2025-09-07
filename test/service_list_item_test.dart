import 'package:favorite_services_app/domain/entities/service.dart';
import 'package:favorite_services_app/presentation/screen/dashboard/widgets/fav_list_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('ServiceListItem shows title, description and favorite button', (
    tester,
  ) async {
    const service = ServiceEntity(id: 1, title: 'S1', description: 'Desc');
    var tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: FavListItem(
          service: service,
          isFavorite: false,
          onFavoriteTap: () {
            tapped = true;
          },
        ),
      ),
    );

    expect(find.text('S1'), findsOneWidget);
    expect(find.text('Desc'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    await tester.tap(find.byKey(const Key('favorite_btn_1')));
    expect(tapped, true);
  });
}
