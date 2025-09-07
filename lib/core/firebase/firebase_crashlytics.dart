// part of 'index.dart';

// class _AppCrashlytics {
//   //* MARK: - Convert the class to singleton
//   //? =========================================================

//   _AppCrashlytics._privateConstructor() {
//     // Fetch the report from the server
//     FirebaseCrashlytics.instance.sendUnsentReports();
//   }
//   static final _AppCrashlytics instance = _AppCrashlytics._privateConstructor();

//   //* MARK: - Public Variables
//   //? =========================================================

//   FirebaseFirestore get _db {
//     final FirebaseApp _app = AppConfig.getFirebaseApp(
//         // env: AppConfig.getInstance()?.flavor ?? Environment.prod,
//         );
//     final FirebaseFirestore _instance = FirebaseFirestore.instanceFor(
//       app: _app,
//     )..settings = const Settings(
//         sslEnabled: true,
//         persistenceEnabled: false,
//         cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
//       );
//     return _instance;
//   }

//   CollectionReference<Map<String, dynamic>> get _crashLogs {
//     return _db.collection('crash_logs');
//   }

//   List<String> get crashLogsToIgnore => <String>[
//         'Connection closed before full header was received',
//         'Connection closed while receiving data',
//         'PlatformException(firebase_remote_config, Unable to connect to the server. Check your connection and try again., null, null)',
//         'Cannot retrieve length of file',
//         'Software caused connection abort',
//         'Connection terminated during handshake',
//       ]
//           .map(
//             (String p0) => p0.toLowerCase(),
//           )
//           .toList();

//   //* MARK: - Private Variables
//   //? =========================================================
//   FirebaseCrashlytics get _crashlytics => FirebaseCrashlytics.instance;

//   //* MARK: - Public Methods
//   //? =========================================================
//   bool shouldLogException(String str) {
//     final String _str = str.toLowerCase();
//     bool _doesExist = true;
//     for (final String p0 in crashLogsToIgnore) {
//       if (p0.toLowerCase().contains(_str)) {
//         _doesExist = false;
//         break;
//       }
//     }
//     return _doesExist;
//   }

//   Future<void> logException({
//     required Object e,
//     StackTrace? trace,
//     String? info,
//   }) async {
//     String _info = '';
//     String _trace = '';
//     if (e is Exception && info == null) {
//       _info = e.toString();
//     } else if (info != null) {
//       _info = info;
//     }
//     if (trace != null) {
//       _trace = trace.toString();
//     }
//     await _crashlytics.recordError(
//       e,
//       trace,
//       reason: _trace,
//       printDetails: true,
//       information: <String>[_info],
//     ).onError(
//       _logToFireStore,
//     );
//   }

//   //* MARK: - Private Methods
//   //? =========================================================
//   FutureOr<void> _logToFireStore<E extends Object>(
//     E error,
//     StackTrace trace,
//   ) async {
//     String _info = '';
//     final String _trace = trace.toString();
//     if (error is Exception) {
//       _info = error.toString();
//     }
//     final Map<String, dynamic> _data = <String, dynamic>{
//       'error': _info,
//       'stackTrace': _trace,
//       'time': DateTime.now().toUtc().toString(),
//     };
//     await _crashLogs.add(_data);
//   }
// }
