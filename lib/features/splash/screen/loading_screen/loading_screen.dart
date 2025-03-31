import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast_x/features/router/router.dart';
import 'package:forecast_x/features/splash/bloc/init_bloc.dart';
import 'package:forecast_x/features/splash/screen/welcome_page/welcome_page.dart';
import 'package:forecast_x/utils/ui_kit/app_loader/app_loader.dart';

import 'package:go_router/go_router.dart';

class LoadingScreen extends StatefulWidget {
  final String? path;
  final Object? query;
  const LoadingScreen({super.key, this.path, this.query});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late InitBloc bloc;
  @override
  void initState() {
    bloc = InitBloc()..add(InitAppEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InitBloc, InitState>(
      bloc: bloc,
      listener: (context, state) {
        switch (state) {
          case InitInitial():
            return;

          case InitialComleted():
            if (widget.path != null) {
              context.pushReplacement('${widget.path}?${widget.query}');
            } else {
              context.pushReplacement(routes.forecasts);
            }

          case InitialFirstOpenComleted():
            context.pushReplacement(routes.onboarding);
        }
      },
      builder: (context, state) {
        if (state is InitInitial) {
          return const WelcomePage();
        }
        return const Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: AppLoader(),
            ),
          ],
        );
      },
    );
  }
}
