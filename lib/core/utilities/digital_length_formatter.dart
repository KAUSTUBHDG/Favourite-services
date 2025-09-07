import 'package:flutter/services.dart';

class DigitLengthFormatter extends TextInputFormatter {
  DigitLengthFormatter(this.maxDigits);

  final int maxDigits;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (digitsOnly.length > maxDigits) {
      digitsOnly = digitsOnly.substring(0, maxDigits);
    }
    final String formattedText = _applyFormatting(digitsOnly);
    final int cursorPosition = formattedText.length;
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }

  String _applyFormatting(String digits) {
    if (digits.isEmpty) {
      return '';
    }
    final StringBuffer formattedText = StringBuffer();
    if (maxDigits == 10) {
      // Mobile Number Formatting: (XXX) XXX-XXXX
      if (digits.isNotEmpty) {
        formattedText.write('(');
      }
      if (digits.isNotEmpty) {
        formattedText.write(digits.substring(0, digits.length.clamp(0, 3)));
      }
      if (digits.length >= 4) {
        formattedText.write(') ');
      }
      if (digits.length >= 4) {
        formattedText.write(digits.substring(3, digits.length.clamp(3, 6)));
      }
      if (digits.length >= 7) {
        formattedText.write('-');
      }
      if (digits.length >= 7) {
        formattedText.write(digits.substring(6, digits.length.clamp(6, 10)));
      }
    } else if (maxDigits == 9) {
      // SSN Formatting: XXX-XX-XXXX
      if (digits.isNotEmpty) {
        formattedText.write(digits.substring(0, digits.length.clamp(0, 3)));
      }
      if (digits.length >= 4) {
        formattedText.write('-');
      }
      if (digits.length >= 4) {
        formattedText.write(digits.substring(3, digits.length.clamp(3, 5)));
      }
      if (digits.length >= 6) {
        formattedText.write('-');
      }
      if (digits.length >= 6) {
        formattedText.write(digits.substring(5, digits.length.clamp(5, 9)));
      }
    } else {
      formattedText.write(digits);
    }
    return formattedText.toString();
  }
}
