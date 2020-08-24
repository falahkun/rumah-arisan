import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rumah_arisan/blocs/blocs.dart';
import 'package:rumah_arisan/services/services.dart';
import 'package:rumah_arisan/views/pages/pages.dart';

void main() {
  runApp(MyApp());
}

Widget getErrorWidget(FlutterErrorDetails error) {
  return Container();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = getErrorWidget;
    return StreamProvider.value(
      value: AuthServices.accessToken,
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => PageBloc(OnInitialPage()))],
        child: FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (context, snapshot) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Rumah Arisan',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    scaffoldBackgroundColor: Colors.white),
                // home: CompletingSignUpPage(),
                home: Wrapper(),
              );
            }),
      ),
    );
  }
}
