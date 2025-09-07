// part of 'index.dart';

// /// It is a utility class that provides methods to interact with
// /// __Firebase Analytics__ for tracking user actions and flows.
// /// This class is designed to manage the analytics-related functionalities
// /// in a streamlined manner. It follows a singleton pattern to
// /// ensure that only a single instance of the class is created throughout
// /// the application's lifecycle.
// class _AnalyticsHelper {
//   _AnalyticsHelper._privateConstructor();

//   static final _AnalyticsHelper _instance =
//       _AnalyticsHelper._privateConstructor();

//   //* MARK: - Private Variables
//   //? =========================================================

//   /// Private Variable to get the current instance of [FirebaseAnalytics]
//   FirebaseAnalytics get _analytics => FirebaseAnalytics.instance;

//   /// Private Variable to get default value of [AnalyticsCallOptions]
//   // AnalyticsCallOptions get _callOptions => AnalyticsCallOptions(global: true);

//   //* MARK: - Public Methods
//   //? =========================================================

//   /// Sets the user [properties] on the specific device after logging in.
//   /// Majorly used for understanding user specific actions and flows.
//   /// Parameters: -
//   /// * userId: Accepts __String__ as parameter
//   Future<void> setUser({required Map<String, dynamic> properties}) async {
//     final String userId = properties['userId'];
//     await _analytics.setUserId(
//       id: userId,
//       callOptions: _callOptions,
//     );
//     //! MARK: - Set other properties like age, gender, name, etc. here
//     //! Use the below-mentioned code block for reference
//     //? =========================================================
//     /*
//     await _analytics.setUserProperty(
//       name: propertyKey,
//       value: propertyValue,
//       callOptions: _callOptions,
//     );
//     */
//   }

//   /// Logs the screen name of the current screen user is on.
//   Future<void> setScreen({
//     required String screenName,
//   }) async {
//     await _analytics.logScreenView(
//       screenName: screenName,
//       callOptions: _callOptions,
//     );
//   }

//   /// Logs a custom event with the [name] and [parameters] passed.
//   /// Parameters: -
//   /// * name: Accepts [String] as parameter
//   /// * parameters: Accepts [Map<String, dynamic>] as parameter
//   /// * isGlobal: Accepts [bool] as parameter
//   Future<void> logEvent({
//     required String name,
//     Map<String, Object>? parameters,
//     bool isGlobal = false,
//   }) async {
//     // await _analytics.logEvent(
//     //   name: name,
//     //   parameters: parameters,
//     //   callOptions: AnalyticsCallOptions(
//     //     global: isGlobal,
//     //   ),
//     // );
//   }
// }
