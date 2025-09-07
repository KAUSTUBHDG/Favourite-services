part of 'utilities.dart';

class _DateTimeFormat {
  /// Convert 01 Jan 2023 to 2023-01-01
  String convertToYYYYMMDD(String inputDate) {
    final RegExp datePattern = RegExp(r'^\d{4}-\d{2}-\d{2}$');

    if (datePattern.hasMatch(inputDate)) {
      return inputDate; // Return input date if it matches the format.
    }
    if (inputDate.isEmpty) {
      return DateFormat('yyyy-MM-dd').format(DateTime.now());
    }

    try {
      final DateTime date = DateFormat('dd MMM yyyy').parse(inputDate);
      final String isoDate = DateFormat('yyyy-MM-dd').format(date);
      return isoDate;
    } catch (e) {
      return 'Invalid date format';
    }
  }

  /// Converts 2023-01-01 to 01 Jan 2023
  String convertToDDMMMYYY(String inputDate) {
    final RegExp datePattern = RegExp(r'^\d{2} [A-Z][a-z]{2} \d{4}$');

    if (datePattern.hasMatch(inputDate)) {
      return inputDate; // Return input date if it matches the format.
    }
    if (inputDate.isEmpty) {
      return DateFormat('dd MMM yyyy').format(DateTime.now());
    }
    try {
      if (DateTime.tryParse(inputDate) == null) {
        return inputDate;
      }
      final DateTime date = DateTime.parse(inputDate);
      final String formattedDate = DateFormat('dd MMM yyyy').format(date);
      return formattedDate;
    } catch (e) {
      return 'Invalid date format';
    }
  }

  /// Converts 01-01-2023 to 01 Jan 2023
  String convertToDashDDMMMYYY(String inputDate) {
    final RegExp datePattern = RegExp(r'^\d{2} [A-Z][a-z]{2} \d{4}$');

    try {
      // Check if the input date matches the "dd MMM yyyy" format
      if (datePattern.hasMatch(inputDate)) {
        return inputDate; // Return input date if it matches the format.
      }

      // Try parsing the input date as "dd-MM-yyyy" format
      final DateTime dashSeparatedDate =
          DateFormat('dd-MM-yyyy').parse(inputDate);
      return DateFormat('dd MMM yyyy').format(dashSeparatedDate);
    } catch (_) {
      // Return default date if parsing fails
      return inputDate.isEmpty
          ? DateFormat('dd MMM yyyy').format(DateTime.now())
          : 'Invalid date format';
    }
  }

  /// Converts 01/01/2023 to 01 Jan 2023
  String convertToSlashToDDMMYYYFormat(String inputDate) {
    try {
      if (inputDate.isEmpty) {
        return inputDate;
      }
      final DateTime date = DateFormat('dd/MM/yyyy').parseStrict(inputDate);
      final String longFormattedDate =
          DateFormat('dd MMM yyyy', 'en_US').format(date);
      return longFormattedDate;
    } catch (e) {
      return 'Invalid date format';
    }
  }

  String convertToDDMMYYY(String inputDate) {
    final RegExp datePattern = RegExp(r'^\d{2} [A-Z][a-z]{2} \d{4}$');

    if (datePattern.hasMatch(inputDate)) {
      return DateFormat('dd/MM/yyyy')
          .format(DateFormat('dd MMM yyyy').parse(inputDate));
    }

    if (inputDate.isEmpty) {
      return DateFormat('dd/MM/yyyy').format(DateTime.now());
    }

    try {
      if (DateTime.tryParse(inputDate) == null) {
        return inputDate;
      }

      final DateTime date = DateTime.parse(inputDate);
      final String formattedDate = DateFormat('dd/MM/yyyy').format(date);
      return formattedDate;
    } catch (e) {
      return 'Invalid date format';
    }
  }

  /// Converts 2023-01-01 to Jan 2023
  String convertToMMMYYYY(String inputDate) {
    if (inputDate.isEmpty) {
      return DateFormat('MMM yyyy').format(DateTime.now());
    }

    final RegExp datePattern = RegExp(r'^\d{2} [A-Z][a-z]{2} \d{4}$');

    if (datePattern.hasMatch(inputDate)) {
      final List<String> formattedDate = inputDate.split(' ');

      return '${formattedDate[1]} ${formattedDate[2]}'; // Return input date if it matches the format.
    }

    try {
      if (DateTime.tryParse(inputDate) == null) {
        return inputDate;
      }
      final DateTime date = DateTime.parse(inputDate);
      final String formattedDate = DateFormat('MMM yyyy').format(date);
      return formattedDate;
    } catch (e) {
      return 'Invalid date format';
    }
  }

  /// Converts 2023-01-01 to Jan 20, 2023
  String convertToMMMDDYYYY(String inputDate) {
    if (inputDate.isEmpty) {
      return DateFormat('MMM yyyy').format(DateTime.now());
    }
    final RegExp datePattern = RegExp(r'^\d{2} [A-Z][a-z]{2} \d{4}$');
    if (datePattern.hasMatch(inputDate)) {
      final List<String> formattedDate = inputDate.split(' ');
      return '${formattedDate[1]} ${formattedDate[2]}'; // Return input date if it matches the format.
    }
    try {
      if (DateTime.tryParse(inputDate) == null) {
        return inputDate;
      }
      final DateTime date = DateTime.parse(inputDate);
      final String formattedDate = DateFormat('MMM dd, yyyy').format(date);
      return formattedDate;
    } catch (e) {
      return 'Invalid date format';
    }
  }

  String parseToYear(String input) {
    final List<String> dateParts = input.split(' ');
    if (dateParts.length == 1) {
      final List<String> splitDate = input.split('-');
      if (splitDate.length == 3) {
        return splitDate[0];
      }
    }
    if (dateParts.length == 3) {
      return dateParts[2];
    }
    return '';
  }

  /// Converts MillisecondSinceEpoch to 01 Jan 2023 without multiplying with 1000
  String convertMilliSecEpochToDDMMMYYY(
    String inputTime,
  ) {
    try {
      final DateTime? dateTime = DateTime.tryParse(inputTime);
      if (dateTime == null) {
        return inputTime;
      }
      final String formattedDate = DateFormat('dd MMM yyy').format(dateTime);
      return formattedDate;
    } catch (e) {
      return inputTime;
    }
    // final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(inputTime);
  }

  /// Converts MillisecondSinceEpoch to 05:40 PM, 01 Jan 2023 without multiplying with 1000
  String convertMilliSecEpochToHHMMDDMMMYYY(
    int inputTime,
  ) {
    if (inputTime == 0) {
      return '';
    }
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(inputTime);
    final String formattedDate =
        DateFormat('dd MMM yy, hh:mm').format(dateTime);
    return formattedDate;
  }

  /// Converts MillisecondSinceEpoch to 05:40 PM, 01 Jan 2023 without multiplying with 1000
  String convertMilliSecEpochToDDMMYYYYHHMM(
    int inputTime,
  ) {
    if (inputTime == 0) {
      return '';
    }
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(inputTime);
    final String formattedDate =
        DateFormat('dd MMM yyyy, hh:mm').format(dateTime);
    return formattedDate;
  }

  /// Calculates the time difference between an ISO timestamp and a number of milliseconds since epoch and formats it into a human-readable string.
  //
  /// The [millisecondsSinceEpoch] parameter is an integer representing the number of milliseconds since epoch.
  ///
  /// Returns a string representing the time difference between the and [millisecondsSinceEpoch] in a human-readable format.
  String humanReadableTimeString({
    required int millisecondsSinceEpoch,
  }) {
    final DateTime _dateTimeFromEpoch =
        DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);

    final Duration timeDifference =
        DateTime.now().difference(_dateTimeFromEpoch);

    final String _formattedDifference = _formatDuration(timeDifference);
    return _formattedDifference;
  }

  String _formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      final int inDays = duration.inDays;
      return "$inDays${inDays > 1 ? 'd(s)' : 'd'}";
    } else if (duration.inHours > 0) {
      final int inHours = duration.inHours;
      return "$inHours${inHours > 1 ? 'h(s)' : 'h'}";
    } else if (duration.inMinutes > 0) {
      final int inMinutes = duration.inMinutes;
      return "$inMinutes${inMinutes > 1 ? 'm(s)' : 'm'}";
    } else {
      final int inSeconds = duration.inSeconds;
      return "$inSeconds${inSeconds > 1 ? 's(s)' : 's'}";
    }
  }
}
