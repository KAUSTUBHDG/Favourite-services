import 'dart:convert';

import '/core/constants/strings.dart';

extension StringExtension on String? {
  String orEmpty() => this ?? AppStrings.emptyString;

  bool get isNotEmptyOrFalse => this?.isNotEmpty ?? false;

  bool get isValidBase64 {
    if (this == null || this!.isEmpty) {
      return false;
    }

    // Base64 encoding should only contain specific characters and be a multiple of 4 in length
    final RegExp base64Regex = RegExp(r'^[A-Za-z0-9+/]+={0,2}$');
    if (!base64Regex.hasMatch(this!) || this!.length % 4 != 0) {
      return false;
    }

    // Ensure it's decodable
    try {
      base64.decode(this!);
      return true; // Valid and decodable
    } catch (e) {
      return false; // Invalid Base64 (decoding failed)
    }
  }
}
