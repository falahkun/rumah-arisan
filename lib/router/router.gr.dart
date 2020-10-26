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
  static const String communityDiscussPage = '/community-discuss-page';
  static const String messagesPage = '/messages-page';
  static const String chatPage = '/chat-page';
  static const String myCommunitiesPage = '/my-communities-page';
  static const String createCommunity = '/create-community';
  static const String searchPage = '/search-page';
  static const String myCloter = '/my-cloter';
  static const String createCloter = '/create-cloter';
  static const String memberPage = '/member-page';
  static const String notifPage = '/notif-page';
  static const String profilePage = '/profile-page';
  static const all = <String>{
    wrapper,
    mainPage,
    cloterDetail,
    settingPage,
    communityPage,
    communityDiscussPage,
    messagesPage,
    chatPage,
    myCommunitiesPage,
    createCommunity,
    searchPage,
    myCloter,
    createCloter,
    memberPage,
    notifPage,
    profilePage,
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
    RouteDef(Routes.communityDiscussPage, page: CommunityDiscussPage),
    RouteDef(Routes.messagesPage, page: MessagesPage),
    RouteDef(Routes.chatPage, page: ChatPage),
    RouteDef(Routes.myCommunitiesPage, page: MyCommunitiesPage),
    RouteDef(Routes.createCommunity, page: CreateCommunity),
    RouteDef(Routes.searchPage, page: SearchPage),
    RouteDef(Routes.myCloter, page: MyCloter),
    RouteDef(Routes.createCloter, page: CreateCloter),
    RouteDef(Routes.memberPage, page: MemberPage),
    RouteDef(Routes.notifPage, page: NotifPage),
    RouteDef(Routes.profilePage, page: ProfilePage),
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
    CommunityDiscussPage: (data) {
      final args = data.getArgs<CommunityDiscussPageArguments>(
        orElse: () => CommunityDiscussPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CommunityDiscussPage(
          key: args.key,
          slug: args.slug,
          memberToken: args.memberToken,
        ),
        settings: data,
      );
    },
    MessagesPage: (data) {
      final args = data.getArgs<MessagesPageArguments>(
        orElse: () => MessagesPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MessagesPage(
          key: args.key,
          memberToken: args.memberToken,
        ),
        settings: data,
      );
    },
    ChatPage: (data) {
      final args = data.getArgs<ChatPageArguments>(
        orElse: () => ChatPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChatPage(
          key: args.key,
          memberToken: args.memberToken,
          id: args.id,
          token: args.token,
        ),
        settings: data,
      );
    },
    MyCommunitiesPage: (data) {
      final args = data.getArgs<MyCommunitiesPageArguments>(
        orElse: () => MyCommunitiesPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MyCommunitiesPage(
          key: args.key,
          memberToken: args.memberToken,
        ),
        settings: data,
      );
    },
    CreateCommunity: (data) {
      final args = data.getArgs<CreateCommunityArguments>(
        orElse: () => CreateCommunityArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateCommunity(
          key: args.key,
          memberToken: args.memberToken,
          community: args.community,
        ),
        settings: data,
      );
    },
    SearchPage: (data) {
      final args = data.getArgs<SearchPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => SearchPage(
          key: args.key,
          query: args.query,
          currentIndex: args.currentIndex,
          slug: args.slug,
          memberToken: args.memberToken,
        ),
        settings: data,
      );
    },
    MyCloter: (data) {
      final args = data.getArgs<MyCloterArguments>(
        orElse: () => MyCloterArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MyCloter(
          key: args.key,
          memberToken: args.memberToken,
        ),
        settings: data,
      );
    },
    CreateCloter: (data) {
      final args = data.getArgs<CreateCloterArguments>(
        orElse: () => CreateCloterArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateCloter(
          key: args.key,
          memberToken: args.memberToken,
          cloter: args.cloter,
        ),
        settings: data,
      );
    },
    MemberPage: (data) {
      final args = data.getArgs<MemberPageArguments>(
        orElse: () => MemberPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MemberPage(
          key: args.key,
          slug: args.slug,
        ),
        settings: data,
      );
    },
    NotifPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => NotifPage(),
        settings: data,
      );
    },
    ProfilePage: (data) {
      final args = data.getArgs<ProfilePageArguments>(
        orElse: () => ProfilePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfilePage(
          key: args.key,
          memberToken: args.memberToken,
          user: args.user,
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

/// CommunityDiscussPage arguments holder class
class CommunityDiscussPageArguments {
  final Key key;
  final String slug;
  final String memberToken;
  CommunityDiscussPageArguments({this.key, this.slug, this.memberToken});
}

/// MessagesPage arguments holder class
class MessagesPageArguments {
  final Key key;
  final String memberToken;
  MessagesPageArguments({this.key, this.memberToken});
}

/// ChatPage arguments holder class
class ChatPageArguments {
  final Key key;
  final String memberToken;
  final String id;
  final String token;
  ChatPageArguments({this.key, this.memberToken, this.id, this.token});
}

/// MyCommunitiesPage arguments holder class
class MyCommunitiesPageArguments {
  final Key key;
  final String memberToken;
  MyCommunitiesPageArguments({this.key, this.memberToken});
}

/// CreateCommunity arguments holder class
class CreateCommunityArguments {
  final Key key;
  final String memberToken;
  final CommunityData community;
  CreateCommunityArguments({this.key, this.memberToken, this.community});
}

/// SearchPage arguments holder class
class SearchPageArguments {
  final Key key;
  final String query;
  final int currentIndex;
  final String slug;
  final String memberToken;
  SearchPageArguments(
      {this.key,
      this.query = "",
      this.currentIndex = 0,
      this.slug = "",
      @required this.memberToken});
}

/// MyCloter arguments holder class
class MyCloterArguments {
  final Key key;
  final String memberToken;
  MyCloterArguments({this.key, this.memberToken});
}

/// CreateCloter arguments holder class
class CreateCloterArguments {
  final Key key;
  final String memberToken;
  final CloterData cloter;
  CreateCloterArguments({this.key, this.memberToken, this.cloter});
}

/// MemberPage arguments holder class
class MemberPageArguments {
  final Key key;
  final String slug;
  MemberPageArguments({this.key, this.slug});
}

/// ProfilePage arguments holder class
class ProfilePageArguments {
  final Key key;
  final String memberToken;
  final DataResultToken user;
  ProfilePageArguments({this.key, this.memberToken, this.user});
}
