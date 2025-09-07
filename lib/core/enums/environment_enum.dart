enum Environment {
  dev,
  uat,
  prod,
}

extension EnvironmentExt on Environment {
  /// Returns [true] if the __Environment__ is [dev].
  bool get isDev => this == Environment.dev;

  /// Returns [true] if the __Environment__ is [uat].
  bool get isUat => this == Environment.uat;

  /// Returns [true] if the __Environment__ is [prod].
  bool get isProd => this == Environment.prod;

  /// Returns a [String] value for the __Environment__.
  String get strValue {
    switch (this) {
      case Environment.dev:
        return 'Dev';
      case Environment.uat:
        return 'UAT';
      case Environment.prod:
        return 'Prod';
    }
  }

  static Environment parse(String? env) {
    switch (env?.toLowerCase()) {
      case 'dev':
        return Environment.dev;
      case 'uat':
        return Environment.uat;
      case 'prod':
        return Environment.prod;
      default:
        return Environment.dev;
    }
  }
}
