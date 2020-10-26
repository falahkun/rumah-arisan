part of 'pages.dart';

class SettingPage extends StatefulWidget {
  final TokenResult tokenResult;

  const SettingPage({Key key, this.tokenResult}) : super(key: key);
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 15,
                  color: Colors.white,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: FutureBuilder<String>(
                    future: RemoteConfigService.getAppVersion(),
                    builder: (_, snapshot) => Text(
                        "Rumah Arisan | version ${snapshot.data}",
                        textAlign: TextAlign.center),
                  )),
            ),
          ),
          ListView(
            children: [
              TopBar(
                onTap: () {
                  Navigator.pop(context);
                },
                title: "Settings",
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildListTile("Account",
                      trailing: ClipPath.shape(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        child: widget.tokenResult.data.foto == null
                            ? Image.asset(
                                "assets/images/profile_unfilled.png",
                                width: 24,
                                height: 24,
                              )
                            : Image.network(
                                widget.tokenResult.data.foto,
                                width: 24,
                                height: 24,
                                fit: BoxFit.cover,
                              ),
                      ), onTap: () {
                    Navigator.pushNamed(context, Routes.profilePage,
                        arguments: ProfilePageArguments(
                            user: widget.tokenResult.data));
                  }),
                  buildListTile("Kebijakan Rumah Arisan"),
                  buildListTile("Kebijakan Privasi"),
                  buildListTile("Tentang Kami"),
                  buildListTile("Bantuan"),
                  buildListTile("Lainnya"),
                  buildListTile("Bagikan Aplikasi",
                      trailing: Icon(Icons.share)),
                  buildListTile("Beri nilai Aplikasi",
                      trailing: Icon(MdiIcons.commentQuoteOutline)),
                  buildListTile("Laporkan Bug", trailing: Icon(MdiIcons.bug)),
                  buildListTile("Keluar", trailing: Icon(Icons.exit_to_app),
                      onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text("Confirmation"),
                              content: Text("Do you wish to Sign Out ?"),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel")),
                                FlatButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      await AuthServices.removeSession();
                                      context.bloc<AuthBloc>().add(SignOut());
                                      Navigator.pushReplacementNamed(
                                          context, "/");
                                    },
                                    child: Text("Sign Out"))
                              ],
                            ));
                  }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(String title, {Widget trailing, Function onTap}) {
    return ListTile(
        onTap: onTap,
        title: Text(title, style: regular.copyWith(fontSize: 14)),
        trailing: trailing);
  }
}
