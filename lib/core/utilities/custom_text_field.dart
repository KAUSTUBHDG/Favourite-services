import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/core/constants/num_constants.dart';
import '/core/constants/regex_const.dart';
import '/core/themes/app_colors.dart';

/// Returns a __TextFormField__ with the given parameters
/// Parameters: -
/// __REQUIRED__
/// - [controller]: The controller for the text field
/// - [focusNode]: The focus node for the text field
/// - [hintText]: The hint text for the text field
/// - [labelText]: The label text for the text field
/// - [keyboardType]: The keyboard type for the text field
/// - [textInputAction]: The text input action for the text field
/// - [onChanged]: The callback for the onChanged event
///
/// __OPTIONAL__
/// - [errorText]: The error text for the text field
/// - [onSubmitted]: The callback for the onSubmitted event
/// - [isObscureText]: Whether the text field is obscure or not
/// - [onTap]: The callback for the onTap event
/// - [onEditingComplete]: The callback for the onEditingComplete event
/// - [onFieldSubmitted]: The callback for the onFieldSubmitted event
/// - [validator]: The validator for the text field
/// - [onSaved]: The callback for the onSaved event
/// - [onFieldChanged]: The callback for the onFieldChanged event
/// - [isAutoFocus]: Whether the text field is auto focused or not
/// - [isClearEnabled]: Whether the text field has a clear button or not
/// - [prefixIcon]: The prefix icon for the text field
/// - [suffixIcon]: The suffix icon for the text field
/// - [maxLines]: The max lines for the text field
/// - [textAlignVertical]: The text align vertical for the text field
/// - [textCapitalization]: The text capitalization for the text field
/// - [contentPadding]: The content padding for the text field
/// - [inputFormatters]: The input formatters for the text field
/// - [readOnly]: Whether the text field is read only or not
/// - [prefixText]: The prefix text for the text field
/// - [enabled]: Whether the text field is enabled or not
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.textInputAction,
    required this.onChanged,
    this.labelText,
    super.key,
    this.errorText,
    this.onSubmitted,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.validator,
    this.onSaved,
    this.onFieldChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.contentPadding,
    this.maxLength,
    this.minLines,
    this.inputDecoration,
    this.alignLabelWithHint = true,
    this.enableInteractiveSelection,
    this.autovalidateMode,
    this.textAlignVertical = TextAlignVertical.center,
    this.textCapitalization = TextCapitalization.sentences,
    this.inputFormatters = const <TextInputFormatter>[],
    this.prefixText = '',
    this.isObscureText = false,
    this.isAutoFocus = false,
    this.readOnly = false,
    this.expands = false,
    this.shouldExpand = false,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.enableSuggestions = true,
    this.autocorrect = true,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final TextInputAction textInputAction;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final String? labelText;
  final String? errorText;
  final Function(String)? onSubmitted;
  final bool isObscureText;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final FormFieldValidator<String?>? validator;
  final FormFieldSetter<String?>? onSaved;
  final Function(String)? onFieldChanged;
  final bool isAutoFocus;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final TextAlignVertical textAlignVertical;
  final TextCapitalization textCapitalization;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter> inputFormatters;
  final bool readOnly;
  final String prefixText;
  final bool enabled;
  final bool expands;
  final int? maxLength;
  final int? minLines;
  final bool shouldExpand;
  final bool alignLabelWithHint;
  final bool? enableInteractiveSelection;
  final AutovalidateMode? autovalidateMode;
  final bool enableSuggestions;
  final bool autocorrect;
  final InputDecoration? inputDecoration;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorWidth: NumConstants.value1,
      cursorColor: AppColors.color000000,
      autovalidateMode: autovalidateMode,
      expands: expands,
      minLines: minLines,
      maxLength: maxLength,
      readOnly: readOnly,
      controller: controller,
      focusNode: focusNode,
      enableInteractiveSelection: enableInteractiveSelection,
      maxLines: maxLines ?? (shouldExpand == false ? 1 : null),
      autofocus: isAutoFocus,
      textAlignVertical: textAlignVertical,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.deny(RegExConstants.emojiRegExp),
        ...inputFormatters,
      ],
      onChanged: (String value) {
        onChanged(value);
      },
      onTap: () {
        if (controller.text.contains('-') && controller.text.length == 1) {
          controller.clear();
        }
        onTap?.call();
      },
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onEditingComplete: () {
        onEditingComplete?.call();
      },
      onFieldSubmitted: (String value) {
        onFieldSubmitted?.call(value);
      },
      validator: (String? value) {
        return validator?.call(value);
      },
      style: const TextStyle().copyWith(
        color: enabled ? AppColors.color49454F : AppColors.colorA9A8AA,
      ),
      onSaved: onSaved,
      obscureText: isObscureText,
      textInputAction: textInputAction,
      decoration:
          inputDecoration ??
          InputDecoration(
            fillColor: AppColors.colorFFFFFF,
            filled: true,
            alignLabelWithHint: alignLabelWithHint,
            enabled: enabled,
            prefixStyle: const TextStyle().copyWith(
              color: AppColors.color49454F,
            ),
            hintText: hintText,
            hintMaxLines: maxLines,
            errorText: errorText,
            labelStyle: const TextStyle().copyWith(
              color: enabled ? AppColors.color49454F : AppColors.colorA9A8AA,
            ),
            hintStyle: const TextStyle().copyWith(color: AppColors.colorA0A8B4),
            errorStyle: const TextStyle().copyWith(
              color: AppColors.lightColorScheme.error,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefixText: prefixText,
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(NumConstants.value10),
              borderSide: BorderSide(color: AppColors.colorD9D9D9, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(NumConstants.value10),
              borderSide: BorderSide(color: AppColors.color386BF6, width: 0.5),
            ),
            errorBorder:
                (errorText?.isNotEmpty ?? false)
                    ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(NumConstants.value10),
                      borderSide: BorderSide(color: AppColors.colorDD5858),
                    )
                    : null,
            errorMaxLines: 2,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                contentPadding ??
                const EdgeInsets.symmetric(
                  horizontal: NumConstants.value20,
                  vertical: NumConstants.value15,
                ),
          ),
    );
  }
}
