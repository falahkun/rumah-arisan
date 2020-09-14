part of 'pages.dart';

class AccountFragment extends StatelessWidget {
  final TokenResult tokenResult;

  const AccountFragment({Key key, this.tokenResult}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
