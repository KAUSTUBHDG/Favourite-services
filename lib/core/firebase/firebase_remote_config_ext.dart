part of 'firebase_remote_config.dart';

class _FirebaseRemoteConfigKeys {
  //* MARK: - URLs
  //? =========================================================
  static _FirebaseRCURLKeys get urls => _FirebaseRCURLKeys();
  static _FirebaseRemoteConfigDefaultValues get defaultValues =>
      _FirebaseRemoteConfigDefaultValues();
}

class _FirebaseRCURLKeys {
  String get clientId => 'clientId';
}

class _FirebaseRemoteConfigDefaultValues {
  // ignore: unused_field
  final _FirebaseRCURLKeys _keys = _FirebaseRemoteConfigKeys.urls;

  Map<String, dynamic> get defaultValues => <String, dynamic>{
        _keys.clientId: '',
      };
}
