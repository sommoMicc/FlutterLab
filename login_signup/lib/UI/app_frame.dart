import 'package:flutter/material.dart';
import 'package:login_signup/UI/pages/home.dart';
import 'package:login_signup/UI/pages/login.dart';
import 'package:login_signup/model/state/app_state.dart';
import 'package:login_signup/model/state/background_state.dart';
import 'package:provider/provider.dart';

class AppFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableProvider<BackgroundState>(
        builder: (BuildContext context) => BackgroundState(context: context),
        child: OrientationBuilder(
          builder: (_,__) {
            //Prendo l'orientamento del display dalla mediaquery altrimenti
            //incorro nel bug della tastiera a schermo.
            var mediaQuery = MediaQuery.of(context);
            Provider.of<AppState>(context).setOrientationAndSize(
                mediaQuery.orientation,
                mediaQuery.size.height,
                mediaQuery.size.width
            );
            return Navigator(
                initialRoute: '/',
                onGenerateRoute: (RouteSettings settings) {
                  WidgetBuilder builder;

                  switch (settings.name) {
                    case '/':
                    default:
                      builder = (_) => HomePage();
                  }
                  return MaterialPageRoute(builder: builder, settings: settings);
                }
            );
          },
        ),
      ),
    );
  }

}