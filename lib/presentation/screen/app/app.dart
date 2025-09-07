import 'package:favorite_services_app/presentation/screen/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/routes/route_observer.dart';
import '/core/routes/routes.dart';
import '/core/themes/app_colors.dart';
import '/core/themes/themes.dart';
import '/presentation/screen/home/bloc/home_bloc.dart';
import '/presentation/screen/home/home.dart';
import '/presentation/widget/text_scale_clamper/text_scale_calamper.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        SystemChrome.setPreferredOrientations(<DeviceOrientation>[
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);

        return BlocProvider(
          create: (context) => HomeBloc(),
          child: TextScaleFactorClamper(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return MaterialApp(
                  title: 'Loan Officer',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    useMaterial3: true,

                    colorScheme: AppColors.lightColorScheme,
                    checkboxTheme: AppThemes.checkBoxTheme,
                    radioTheme: AppThemes.radioButtonTheme,
                  ),
                  navigatorKey: appNavigatorKey,
                  navigatorObservers: <NavigatorObserver>[routeObserver],
                  onGenerateRoute:
                      (RouteSettings settings) =>
                          Routes.generateRoute(settings),
                  home: DashboardScreen(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
