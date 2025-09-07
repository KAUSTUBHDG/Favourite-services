enum AppRouteObserverEnum {
  didPush,
  didPop,
  didReplace,
}

extension AppRouteObserverEnumExt on AppRouteObserverEnum {
  /// Returns `true` if the enum is [AppRouteObserverEnum.didPush].
  bool get isDidPush => this == AppRouteObserverEnum.didPush;

  /// Returns `true` if the enum is [AppRouteObserverEnum.didPop].
  bool get isDidPop => this == AppRouteObserverEnum.didPop;

  /// Returns `true` if the enum is [AppRouteObserverEnum.didReplace].
  bool get isDidReplace => this == AppRouteObserverEnum.didReplace;

  /// Returns the string value of the enum.
  String get strValue {
    switch (this) {
      case AppRouteObserverEnum.didPush:
        return "didPush";
      case AppRouteObserverEnum.didPop:
        return "didPop";
      case AppRouteObserverEnum.didReplace:
        return "didReplace";
    }
  }
}
