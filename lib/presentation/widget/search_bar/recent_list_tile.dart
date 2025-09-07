import 'package:flutter/material.dart';
import '/core/constants/num_constants.dart';
import '/core/themes/app_colors.dart';

class RecentListTile extends StatelessWidget {
  const RecentListTile({required this.title, required this.onTap, super.key});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        vertical: NumConstants.value10,
      ),
      dense: true,
      horizontalTitleGap: NumConstants.value10,
      minLeadingWidth: NumConstants.zero,
      minTileHeight: NumConstants.zero,
      minVerticalPadding: NumConstants.zero,
      leading: Icon(Icons.history),
      splashColor: Colors.transparent,
      title: Text(
        title,
        style: TextStyle(
          fontSize: NumConstants.value14,
          fontWeight: FontWeight.w400,
          color: AppColors.color281A3E,
        ),
      ),
    );
  }
}
