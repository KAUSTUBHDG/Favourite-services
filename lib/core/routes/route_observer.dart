import 'package:flutter/material.dart';
import '/core/enums/route_observer_enum.dart';
import '/core/logger/logger_const.dart';

final AppRouteObserver routeObserver = AppRouteObserver();

class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  //* MARK: - Private Variables
  //? =========================================================
  final List<String> _routes = <String>[];

  //* MARK: - Public Variables
  //? =========================================================

  /// Returns the current route of the application.
  String get currentRoute {
    if (_routes.isEmpty) {
      return "";
    }
    final StringBuffer _buffer = StringBuffer();
    _routes.forEach((String p0) => _buffer.write(p0));
    return _buffer.toString();
  }

  /// Returns the list of routes of the application.
  List<String> get routes {
    return _routes.reversed.toList();
  }

  //* MARK: - Overriding Methods
  //? =========================================================
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _sendScreenView(route, operation: AppRouteObserverEnum.didPush);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute && oldRoute is PageRoute) {
      _sendScreenView(
        newRoute,
        operation: AppRouteObserverEnum.didReplace,
        oldRoute: oldRoute,
      );
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (route is PageRoute) {
      _sendScreenView(route, operation: AppRouteObserverEnum.didPop);
    }
  }

  //* MARK: - Private Methods
  //? =========================================================

  /// Sends the screen view to __Firebase Analytics__.
  /// It will first check if the [route.settings.name] is empty or not.
  /// If it is empty, then it will return without sending the screen view.
  /// If it is not empty, then it will check the [operation] and perform
  /// the respective operation.
  /// If the [operation] is [AppRouteObserverEnum.didPush], then it will
  /// add the [route.settings.name] to the [_routes] list.
  /// If the [operation] is [AppRouteObserverEnum.didPop], then it will
  /// remove the [route.settings.name] from the [_routes] list.
  /// If the [operation] is [AppRouteObserverEnum.didReplace], then it will
  /// replace the [oldRoute.settings.name] with the [route.settings.name] in the [_routes] list.
  /// After performing the respective operation, it will send the screen view
  /// to __Firebase Analytics__.
  /// Parameters: -
  /// * route: Accepts [PageRoute] as parameter
  /// * operation: Accepts [AppRouteObserverEnum] as parameter
  /// * oldRoute: Accepts [PageRoute] as parameter
  void _sendScreenView(
    PageRoute<dynamic> route, {
    required AppRouteObserverEnum operation,
    PageRoute<dynamic>? oldRoute,
  }) {
    final String screenName = route.settings.name ?? "";
    if (screenName.isEmpty) {
      return;
    }
    switch (operation) {
      case AppRouteObserverEnum.didPush:
        if (screenName != "/") {
          _routes.add(screenName);
        }
        break;
      case AppRouteObserverEnum.didPop:
        final int _lastIndex = _routes.lastIndexOf(screenName);
        if (_lastIndex != -1) {
          _routes.removeAt(_lastIndex);
        }
        break;
      case AppRouteObserverEnum.didReplace:
        final String previousScreenName = oldRoute?.settings.name ?? "";
        if (previousScreenName.isEmpty) {
          return;
        }
        final int index = _routes.indexOf(previousScreenName);
        if (index == -1) {
          if (screenName != "/") {
            _routes.add(screenName);
          }
          return;
        }
        _routes[index] = screenName;
        break;
    }
    logger.debug("Current Route: $currentRoute");
    if (operation.isDidPop) {
      return;
    }
    // FirebaseHelper.analytics
    //     .setScreen(
    //       screenName: screenName,
    //     )
    //     .then(
    //       (_) => logger.debug(
    //         "Current Route: $currentRoute",
    //
    //       ),
    //     );
  }
}
