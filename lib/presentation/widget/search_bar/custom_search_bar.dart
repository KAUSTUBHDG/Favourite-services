import 'package:flutter/material.dart';
import '/core/constants/num_constants.dart';
import '/core/constants/strings.dart';
import '/core/themes/app_colors.dart';
import '/core/utilities/buttons/custom_inkwell.dart';
import '/core/utilities/buttons/custom_text_button.dart';
import '/core/utilities/custom_text_field.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    required this.controller,
    required this.onFieldSubmitted,
    required this.suggestionList,
    required this.onTap,
    required this.recentList,
    required this.showRecent,
    required this.focusNode,
    required this.previousScreen,
    required this.isRecentLoading,
    required this.onClearTextfield,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onFieldSubmitted;
  final VoidCallback onClearTextfield;
  final Widget suggestionList;
  final VoidCallback onTap;
  final Widget recentList;
  final bool showRecent;
  final bool isRecentLoading;
  final String previousScreen;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final FocusNode _focusNode = FocusNode();

  @override
  void didUpdateWidget(covariant CustomSearchBar oldWidget) {
    _focusNode.requestFocus();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _focusNode
      ..unfocus()
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(NumConstants.value12),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: NumConstants.value45,
                        child: CustomTextField(
                          controller: widget.controller,
                          focusNode: _focusNode,
                          hintText: AppStrings.search,
                          textInputAction: TextInputAction.search,
                          onFieldSubmitted: (String value) {
                            if (value.trim().length >= 3) {
                              widget.focusNode.unfocus();
                              widget.onFieldSubmitted(value);
                            }
                          },
                          onChanged: (String value) {},
                          inputDecoration: InputDecoration(
                            filled: true,
                            suffixIcon:
                                ValueListenableBuilder<TextEditingValue>(
                                  valueListenable: widget.controller,
                                  builder: (
                                    BuildContext context,
                                    TextEditingValue value,
                                    Widget? child,
                                  ) {
                                    if (value.text.isNotEmpty) {
                                      return CustomInkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          widget.controller.clear();
                                          widget.onClearTextfield();
                                        },
                                        analyticsLabel: 'Clear',
                                        analyticsParameters: <String, Object>{
                                          'screen': 'Search',
                                          'label': 'clear',
                                          'previous_screen':
                                              widget.previousScreen,
                                        },
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: AppColors.color7B7980,
                                          size: NumConstants.value20,
                                        ),
                                      );
                                    }
                                    return const SizedBox.shrink();
                                  },
                                ),
                            isDense: true,
                            fillColor: AppColors.colorF5F5F6,
                            hintStyle: TextStyle(
                              color: AppColors.color7B7980,
                              fontSize: NumConstants.value16,
                            ),
                            hintText: AppStrings.search,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                NumConstants.value10,
                              ),
                              borderSide: BorderSide(
                                color: AppColors.colorF5F5F6,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                NumConstants.value10,
                              ),
                              borderSide: BorderSide(
                                color: AppColors.colorF5F5F6,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                NumConstants.value10,
                              ),
                              borderSide: BorderSide(
                                color: AppColors.colorF5F5F6,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    CustomTextButton(
                      label: AppStrings.cancel,
                      textColor: AppColors.color386BF6,
                      onTap: () {
                        widget.onTap();
                        Navigator.of(context).pop();
                      },
                      analyticsLabel: 'Cancel',
                      analyticsParameters: <String, Object>{
                        'screen': 'Search',
                        'label': 'Cancel',
                        'previous_screen': widget.previousScreen,
                      },
                    ),
                  ],
                ),
                const SizedBox(height: NumConstants.value15),
                Flexible(child: widget.suggestionList),
                const SizedBox(height: NumConstants.value15),
                if (widget.showRecent)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.recentSearch,
                      style: TextStyle(
                        fontSize: NumConstants.value14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.color878B92,
                      ),
                    ),
                  ),
                if (widget.showRecent)
                  const SizedBox(height: NumConstants.value22),
                if (widget.showRecent)
                  Flexible(child: widget.recentList)
                else if (widget.isRecentLoading)
                  const Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
