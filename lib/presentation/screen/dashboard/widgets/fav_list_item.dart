import 'package:favorite_services_app/domain/entities/service.dart';
import 'package:flutter/material.dart';

class FavListItem extends StatelessWidget {
  final ServiceEntity service;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const FavListItem({
    super.key,
    required this.service,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(service.title),
      subtitle: Text(
        service.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        key: Key('favorite_btn_${service.id}'),
        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
        onPressed: onFavoriteTap,
      ),
    );
  }
}
