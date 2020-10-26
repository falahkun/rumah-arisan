import 'package:auto_route/auto_route_annotations.dart';
import 'package:rumah_arisan/views/pages/pages.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: Wrapper, initial: true),
    MaterialRoute(page: MainPage),
    MaterialRoute(page: CloterDetail),
    MaterialRoute(page: SettingPage),
    MaterialRoute(page: CommunityPage),
    MaterialRoute(page: CommunityDiscussPage),
    MaterialRoute(
      page: MessagesPage,
    ),
    MaterialRoute(page: ChatPage),
    MaterialRoute(page: MyCommunitiesPage),
    MaterialRoute(page: CreateCommunity),
    MaterialRoute(page: SearchPage),
    MaterialRoute(page: MyCloter),
    MaterialRoute(page: CreateCloter),
    MaterialRoute(page: MemberPage),
    MaterialRoute(page: NotifPage),
    MaterialRoute(page: ProfilePage),
  ],
)
class $Router {}
