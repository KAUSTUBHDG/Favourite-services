import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/di/di.dart';
import '/core/routes/routes_constants.dart';
import '/presentation/screen/home/bloc/home_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create:
          (BuildContext context) =>
              locator<HomeBloc>()..add(CheckAuthentication()),
      child: Scaffold(
        body: BlocConsumer<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState state) {
            return const CircularProgressIndicator();
          },
          listener: (BuildContext context, HomeState state) {
            if (state is HomeToLogin) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RoutesConstants.login,
                (Route<dynamic> route) => false,
                arguments: 1,
              );
            }
            if (state is HomeToDashboard) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RoutesConstants.dashboardScreen,
                (Route<dynamic> route) => false,
                arguments: 1,
              );
            }
          },
        ),
      ),
    );
  }
}
