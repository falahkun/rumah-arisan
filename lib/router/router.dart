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
  ],
)
class $Router {}
