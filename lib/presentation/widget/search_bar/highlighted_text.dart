import 'package:flutter/material.dart';
import '/core/constants/num_constants.dart';
import '/core/themes/app_colors.dart';

class HighlightedText extends StatelessWidget {
  const HighlightedText({
    required this.text,
    required this.searchTerm,
    super.key,
  });
  final String text;
  final String searchTerm;

  @override
  Widget build(BuildContext context) {
    if (searchTerm.isEmpty ||
        !text.toLowerCase().contains(searchTerm.toLowerCase())) {
      return Text(
        text,
        style: TextStyle(
          fontSize: NumConstants.value13,
          fontWeight: FontWeight.w400,
          color: AppColors.color281A3E,
        ),
      );
    }

    final int startIndex = text.toLowerCase().indexOf(searchTerm.toLowerCase());
    final int endIndex = startIndex + searchTerm.length;

    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: text.substring(0, startIndex),
            style: TextStyle(
              fontSize: NumConstants.value13,
              fontWeight: FontWeight.w400,
              color: AppColors.color281A3E,
            ),
          ),
          TextSpan(
            text: text.substring(startIndex, endIndex),
            style: TextStyle(
              fontSize: NumConstants.value13,
              fontWeight: FontWeight.w600,
              color: AppColors.color281A3E,
            ),
          ),
          TextSpan(
            text: text.substring(endIndex),
            style: TextStyle(
              fontSize: NumConstants.value13,
              fontWeight: FontWeight.w400,
              color: AppColors.color281A3E,
            ),
          ),
        ],
      ),
    );
  }
}
