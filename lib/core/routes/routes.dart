import 'package:flutter/cupertino.dart';

import '/core/routes/routes_constants.dart';
import '/presentation/screen/app/app.dart';
import '/presentation/screen/dashboard/dashboard_screen.dart';
import '/presentation/screen/home/home.dart';

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

/// A utility class for managing application navigation and route generation.
class Routes {
  ///
  /// Generates a route based on the provided [RouteSettings].
  ///
  /// This method checks the `name` property of [settings] to determine
  /// which page to navigate to. It supports the following routes:
  /// - `RoutesConstants.home`: Navigates to the `Home` page.
  /// - `RoutesConstants.app`: Navigates to the `MyApp` page.
  ///
  /// If an unknown route name is provided, it defaults to navigating
  /// to the `MyApp` page.
  ///
  /// ### Parameters:
  /// - [settings]: An instance of `RouteSettings` that contains the
  ///   name of the route and any associated arguments.
  ///
  /// ### Returns:
  /// A `Route<dynamic>` that corresponds to the specified route name.
  ///
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstants.home:
        return _createRoute(const Home());
      case RoutesConstants.app:
        return _createRoute(const MyApp());
      // case RoutesConstants.login:
      //   return _createRoute(Login());
      case RoutesConstants.dashboardScreen:
        return _createRoute(DashboardScreen());

      default:
        return _createRoute(const MyApp());
    }
  }

  ///
  /// Creates a route for the specified [page].
  ///
  /// This method creates a `TurnPageRoute` with a builder function
  /// that returns the specified widget as the destination of the route.
  /// It customizes the route transition with a specified overleaf color.
  ///
  /// ### Parameters:
  /// - [page]: A `Widget` that represents the destination of the route.
  ///
  /// ### Returns:
  /// A `Route<dynamic>` that encapsulates the provided page.
  ///
  static Route<dynamic> _createRoute(Widget page) {
    return CupertinoPageRoute<dynamic>(builder: (BuildContext context) => page);
  }
}
