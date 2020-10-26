import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rumah_arisan/blocs/blocs.dart';
import 'package:rumah_arisan/router/router.gr.dart';
import 'package:rumah_arisan/services/services.dart';
import 'package:rumah_arisan/views/pages/pages.dart';

void main() {
  runApp(MyApp());
}

Widget getErrorWidget(FlutterErrorDetails error) {
  return ErrorPage(error: error);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = getErrorWidget;
    return StreamProvider.value(
      value: AuthServices.onAuthStateChanged,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PageBloc(OnInitialPage())),
          BlocProvider(
            create: (_) => AuthBloc(OnInitialAuth()),
          ),
          BlocProvider(
            create: (_) => CloterBloc(OnInitialCloter()),
          ),
          BlocProvider(
            create: (_) => SliderBloc(OnInitialSlider()),
          ),
          BlocProvider(
            create: (_) => UserBloc(OnInitialUser()),
          ),
          BlocProvider(create: (_) => SubdistrictBloc(OnInitialSubdistrict())),
          BlocProvider(
            create: (_) => CloterBloc(OnInitialCloter()),
          ),
          BlocProvider(
            create: (_) => CdetailBloc(OnInitialCDetail()),
          ),
          BlocProvider(
            create: (_) => CmemberBloc(OnInitialCMember()),
          ),
          BlocProvider(create: (_) => CategoryBloc(OnInitialCategory())),
          BlocProvider(create: (_) => CommunityBloc(OnInitialCommunity())),
          BlocProvider(create: (_) => CommunitiesBloc(OnInitialCommunities())),
          BlocProvider(create: (_) => ComDiscussBloc(OnInitialComDiscuss())),
          BlocProvider(
            create: (_) => ChatsBloc(OnInitialChats()),
          ),
          BlocProvider(create: (_) => MessageBloc(OnInitialMessage())),
          BlocProvider(create: (_) => MCBloc(OnInitialMC())),
          BlocProvider(create: (_) => MOCBloc(OnInitialMOC())),
          BlocProvider(create: (_) => UNBloc(OnInitialUN())),
          BlocProvider(create: (_) => MemberdBloc()),
          BlocProvider(create: (_) => CfBloc()),
        ],
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
                // home: NotifPage(),
                initialRoute: "/",
                onGenerateRoute: Router().onGenerateRoute,
              );
            }),
      ),
    );
  }
}
