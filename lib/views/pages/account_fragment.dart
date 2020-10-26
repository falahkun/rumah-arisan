part of 'pages.dart';

class AccountFragment extends StatelessWidget {
  final TokenResult tokenResult;

  const AccountFragment({Key key, this.tokenResult}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(tokenResult.data.nama);
    return Scaffold(
      body: ListView(
        children: [
          TopSetting(
            onTap: () {
              Navigator.pushNamed(context, Routes.settingPage,
                  arguments: SettingPageArguments(tokenResult: tokenResult));
              // context.bloc<PageBloc>().add(GoToSettingPage(tokenResult));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipPath.shape(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      child: tokenResult.data.foto == null
                          ? Image.asset(
                              "assets/images/profile_unfilled.png",
                              width: 45,
                              height: 45,
                            )
                          : Image.network(
                              tokenResult.data.foto,
                              width: 45,
                              height: 45,
                              fit: BoxFit.cover,
                            ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tokenResult.data.nama,
                          style: bold.copyWith(fontSize: 16),
                        ),
                        Text(
                          tokenResult.data.email,
                          style: regular.copyWith(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 37.0, right: 36, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  4,
                  (index) => MenuItem(
                        onTap: () {
                          if (index == 0)
                            Navigator.pushNamed(
                                context, Routes.myCommunitiesPage,
                                arguments: MyCommunitiesPageArguments(
                                    memberToken: tokenResult.data.token));
                          if (index == 1)
                            Navigator.pushNamed(context, Routes.myCloter,
                                arguments: MyCloterArguments(
                                    memberToken: tokenResult.data.token));
                        },
                        title: "Menu $index",
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
