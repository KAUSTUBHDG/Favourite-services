import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '/core/logger/logger_const.dart';
import '/core/shared_prefs/local_storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  // Private constructor
  LocalStorage._internal();
  // Convert the class to singleton
  static final LocalStorage instance = LocalStorage._internal();

  //* MARK: - Private Variables
  //? =========================================================

  /// Secure Storage Instance
  FlutterSecureStorage? _secureStorage;
  SharedPreferences? _sharedPreferences;

  AndroidOptions get _aOptions {
    return const AndroidOptions(encryptedSharedPreferences: true);
  }

  IOSOptions get _iOptions {
    return const IOSOptions(accountName: 'loan_officer');
  }

  //* MARK: - Public Functions
  //? =========================================================

  /// Set the [**Boolean**] value of a key in the secure storage
  /// Parameters: -
  /// * key: The key for which the value is to be set. [**String**]
  /// * value: The value to be set. [**Boolean**]
  Future<bool> setBool({
    required String key,
    required bool value,
    bool isSecure = false,
  }) async {
    try {
      if (isSecure) {
        if (_secureStorage == null) {
          return false;
        }
        await _secureStorage!.write(key: key, value: value.toString());
        return true;
      }
      _sharedPreferences ??= await SharedPreferences.getInstance();
      return await _sharedPreferences?.setBool(
            key,
            value.toString() == 'true',
          ) ??
          false;
    } catch (e, trace) {
      logger.debug(e, stackTrace: trace);
      return false;
    }
  }

  /// Get the [**Boolean**] value of a key from the secure storage
  /// Parameters: -
  /// * key: The key for which the value is to be fetched. [**String**]
  Future<bool?> getBool({required String key, bool isSecure = false}) async {
    try {
      if (isSecure) {
        if (_secureStorage == null) {
          return null;
        }
        final String? _value = await _secureStorage!.read(key: key);
        if (_value == null) {
          return null;
        }
        return _value == 'true';
      }
      _sharedPreferences ??= await SharedPreferences.getInstance();
      return _sharedPreferences?.getBool(key);
    } catch (e, trace) {
      logger.debug(e, stackTrace: trace);
      return null;
    }
  }

  /// Set the [**String**] value of a key in the secure storage
  /// Parameters: -
  /// * key: The key for which the value is to be set. [**String**]
  /// * value: The value to be set. [**String**]
  Future<bool> setString({
    required String key,
    required String value,
    bool isSecure = false,
  }) async {
    try {
      if (isSecure) {
        if (_secureStorage == null) {
          return false;
        }
        await _secureStorage!.write(key: key, value: value);
        return true;
      }
      _sharedPreferences ??= await SharedPreferences.getInstance();
      return (await _sharedPreferences?.setString(key, value)) ?? false;
    } catch (e, trace) {
      logger.debug(e, stackTrace: trace);
      return false;
    }
  }

  /// Get the [**String**] value of a key from the secure storage
  /// Parameters: -
  /// * key: The key for which the value is to be fetched. [**String**]
  Future<String?> getString({
    required String key,
    bool isSecure = false,
  }) async {
    try {
      if (isSecure) {
        if (_secureStorage == null) {
          return null;
        }
        final String? _value = await _secureStorage!.read(key: key);
        return _value;
      }
      _sharedPreferences ??= await SharedPreferences.getInstance();
      return _sharedPreferences?.getString(key);
    } catch (e, trace) {
      logger.debug(e, stackTrace: trace);
      return null;
    }
  }

  /// Set the [**int**] value of a key in the secure storage
  /// Parameters: -
  /// * key: The key for which the value is to be set. [**String**]
  /// * value: The value to be set. [**int**]
  Future<bool> setInt({
    required String key,
    required int value,
    bool isSecure = false,
  }) async {
    try {
      if (isSecure) {
        if (_secureStorage == null) {
          return false;
        }
        await _secureStorage!.write(key: key, value: value.toString());
        return true;
      }
      _sharedPreferences ??= await SharedPreferences.getInstance();
      return (await _sharedPreferences?.setInt(key, value)) ?? false;
    } catch (e, trace) {
      logger.debug(e, stackTrace: trace);
      return false;
    }
  }

  /// Get the [**int**] value of a key from the secure storage
  /// Parameters: -
  /// * key: The key for which the value is to be fetched. [**String**]
  Future<int?> getInt({required String key, bool isSecure = false}) async {
    try {
      if (isSecure) {
        if (_secureStorage == null) {
          return null;
        }
        final String? _value = await _secureStorage!.read(key: key);
        return _value != null ? int.tryParse(_value) : null;
      }
      _sharedPreferences ??= await SharedPreferences.getInstance();
      return _sharedPreferences?.getInt(key);
    } catch (e, trace) {
      logger.debug(e, stackTrace: trace);
      return null;
    }
  }

  /// Set the [**double**] value of a key in the secure storage
  /// Parameters: -
  /// * key: The key for which the value is to be set. [**String**]
  /// * value: The value to be set. [**double**]
  Future<bool> setDouble({
    required String key,
    required double value,
    bool isSecure = false,
  }) async {
    try {
      if (isSecure) {
        if (_secureStorage == null) {
          return false;
        }
        await _secureStorage!.write(key: key, value: value.toString());
        return true;
      }
      _sharedPreferences ??= await SharedPreferences.getInstance();
      return await _sharedPreferences?.setDouble(key, value) ?? false;
    } catch (e, trace) {
      logger.debug(e, stackTrace: trace);
      return false;
    }
  }

  /// Get the [**double**] value of a key from the secure storage
  /// Parameters: -
  /// * key: The key for which the value is to be fetched. [**String**]
  Future<double?> getDouble({
    required String key,
    bool isSecure = false,
  }) async {
    try {
      if (isSecure) {
        if (_secureStorage == null) {
          return null;
        }
        final String? _value = await _secureStorage!.read(key: key);
        return _value != null ? double.tryParse(_value) : null;
      }
      _sharedPreferences ??= await SharedPreferences.getInstance();
      return _sharedPreferences?.getDouble(key);
    } catch (e, trace) {
      logger.debug(e, stackTrace: trace);
      return null;
    }
  }

  /// Clears the value of a key from the secure storage
  /// Parameters: -
  /// * key: The key for which the value is to be cleared. [**String**]
  /// * isSecure: Whether the value is to be cleared from the secure storage or not. [**bool**] (optional)
  ///
  /// Returns: [**bool**]
  ///     * true: If the value was cleared successfully
  ///     * false: If the value was not cleared successfully
  Future<bool> remove({required String key, bool isSecure = false}) async {
    try {
      if (isSecure) {
        if (_secureStorage == null) {
          return false;
        }
        await _secureStorage!.delete(key: key);
        return true;
      }
      _sharedPreferences ??= await SharedPreferences.getInstance();
      return await _sharedPreferences?.remove(key) ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Clear the local values stored in Shared Preferences
  /// Parameters: -
  /// * key: The key for which the value is to be cleared. [**String**] (optional)
  Future<bool> clear() async {
    try {
      await _sharedPreferences?.clear();
      logger.error('============= Shared Pref Cleared =============');

      await _secureStorage?.deleteAll();
      logger.error('============= Secure Storage Cleared =============');

      final bool _hasLocalStorageValues =
          _sharedPreferences?.getKeys().isNotEmpty ?? false;

      final bool _hasSecureStorageValues =
          (await _secureStorage?.readAll())?.isNotEmpty ?? false;

      if (!_hasLocalStorageValues && !_hasSecureStorageValues) {
        logger.error('============= Local Storage Cleared =============');
        return true;
      }
      logger.debug(
        '============== Local Storage NOT Cleared =================',
      );
      return false;
    } catch (e) {
      return false;
    }
  }
}

//* MARK: - Private Methods
//? =========================================================
extension LocalStorageExt on LocalStorage {
  /// * _Initialize the Shared Preferences and Secure Storage_
  /// This method should be called at the start of the app
  ///
  /// Usage: -
  /// ```dart
  /// await LocalStorage.instance.init();
  /// ```
  Future<void> init() async {
    _secureStorage = FlutterSecureStorage(
      aOptions: _aOptions,
      iOptions: _iOptions,
    );
    _sharedPreferences = await SharedPreferences.getInstance();

    final bool? _isNotInitialLaunch = await getBool(
      key: LocalStorageKeys.isInitialLaunch,
    );

    if (_isNotInitialLaunch != true) {
      await clear();
      await setBool(key: LocalStorageKeys.isInitialLaunch, value: true);
    }

    final Map<String, String> _existingData = await _secureStorage!.readAll();
    final StringBuffer _buffer = StringBuffer();
    for (final String p0 in _existingData.keys) {
      _buffer.write('key: $p0, value: ${_existingData[p0]}\n');
    }
    logger.debug('============ Secure Storage Data =============\n$_buffer');

    final Set<String> keys = _sharedPreferences!.getKeys();

    // Create a map to store all key-value pairs
    final Map<String, dynamic> allData = <String, dynamic>{};

    // Loop through keys and retrieve each value
    for (final String key in keys) {
      allData[key] = _sharedPreferences!.get(key);
    }
    logger.debug(
      '============ Shared Preferences Data =============\n${allData..forEach((String key, dynamic value) {
        logger.d('$key: $value');
      })}',
    );
  }
}
