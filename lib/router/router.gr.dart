// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import '../views/pages/pages.dart';

class Routes {
  static const String wrapper = '/';
  static const String mainPage = '/main-page';
  static const String cloterDetail = '/cloter-detail';
  static const String settingPage = '/setting-page';
  static const String communityPage = '/community-page';
  static const all = <String>{
    wrapper,
    mainPage,
    cloterDetail,
    settingPage,
    communityPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.wrapper, page: Wrapper),
    RouteDef(Routes.mainPage, page: MainPage),
    RouteDef(Routes.cloterDetail, page: CloterDetail),
    RouteDef(Routes.settingPage, page: SettingPage),
    RouteDef(Routes.communityPage, page: CommunityPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Wrapper: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Wrapper(),
        settings: data,
      );
    },
    MainPage: (data) {
      final args = data.getArgs<MainPageArguments>(
        orElse: () => MainPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainPage(
          key: args.key,
          indexPage: args.indexPage,
        ),
        settings: data,
      );
    },
    CloterDetail: (data) {
      final args = data.getArgs<CloterDetailArguments>(
        orElse: () => CloterDetailArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CloterDetail(
          key: args.key,
          memberToken: args.memberToken,
          slug: args.slug,
          cloterData: args.cloterData,
        ),
        settings: data,
      );
    },
    SettingPage: (data) {
      final args = data.getArgs<SettingPageArguments>(
        orElse: () => SettingPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SettingPage(
          key: args.key,
          tokenResult: args.tokenResult,
        ),
        settings: data,
      );
    },
    CommunityPage: (data) {
      final args = data.getArgs<CommunityPageArguments>(
        orElse: () => CommunityPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CommunityPage(
          key: args.key,
          slug: args.slug,
          memberToken: args.memberToken,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// MainPage arguments holder class
class MainPageArguments {
  final Key key;
  final int indexPage;
  MainPageArguments({this.key, this.indexPage = 0});
}

/// CloterDetail arguments holder class
class CloterDetailArguments {
  final Key key;
  final String memberToken;
  final String slug;
  final CloterDetailResult cloterData;
  CloterDetailArguments(
      {this.key, this.memberToken, this.slug, this.cloterData});
}

/// SettingPage arguments holder class
class SettingPageArguments {
  final Key key;
  final TokenResult tokenResult;
  SettingPageArguments({this.key, this.tokenResult});
}

/// CommunityPage arguments holder class
class CommunityPageArguments {
  final Key key;
  final String slug;
  final String memberToken;
  CommunityPageArguments({this.key, this.slug, this.memberToken});
}
