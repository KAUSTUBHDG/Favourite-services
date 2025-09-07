import 'package:flutter/material.dart';
import '/core/constants/num_constants.dart';
import '/presentation/widget/search_bar/highlighted_text.dart';

class SuggestionListTile extends StatelessWidget {
  const SuggestionListTile({
    required this.title,
    required this.subTitle,
    required this.searchTerm,
    super.key,
  });

  final String title;
  final String subTitle;
  final String searchTerm;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      horizontalTitleGap: NumConstants.zero,
      minLeadingWidth: NumConstants.zero,
      minTileHeight: NumConstants.zero,
      minVerticalPadding: NumConstants.zero,
      title: HighlightedText(text: title, searchTerm: searchTerm),
      subtitle: HighlightedText(text: subTitle, searchTerm: searchTerm),
    );
  }
}
