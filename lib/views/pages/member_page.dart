part of 'pages.dart';

class MemberPage extends StatefulWidget {
  final String slug;

  const MemberPage({Key key, this.slug}) : super(key: key);
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    final userToken = Provider.of<String>(context);
    context.bloc<MemberdBloc>().add(FetchMemberd(widget.slug, userToken));
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              buildTopBar(),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<MemberdBloc, MemberdState>(
                builder: (_, state) => (state is OnMemberdLoaded)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  state.member.data.foto ??
                                      placeHolderImageUrl(
                                          state.member.data.nama),
                                  height: 60,
                                  width: 60,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "${state.member.data.totalFollowers}",
                                            style: regular.copyWith(
                                              fontSize: 23,
                                            )),
                                        SizedBox(height: 15),
                                        Text("Follower",
                                            style:
                                                regular.copyWith(fontSize: 14)),
                                      ],
                                    ),
                                    SizedBox(width: 19),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "${state.member.data.totalFollowing}",
                                            style: regular.copyWith(
                                              fontSize: 23,
                                            )),
                                        SizedBox(height: 15),
                                        Text("Following",
                                            style:
                                                regular.copyWith(fontSize: 14)),
                                      ],
                                    ),
                                    SizedBox(width: 19),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "${state.member.data.totalFriends}",
                                            style: regular.copyWith(
                                              fontSize: 23,
                                            )),
                                        SizedBox(height: 15),
                                        Text("Friend",
                                            style:
                                                regular.copyWith(fontSize: 14)),
                                      ],
                                    ),
                                    SizedBox(width: 19),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Text(
                                "${state.member.data.namaKecamatan}, ${state.member.data.namaKabupaten}, ${state.member.data.namaProvinsi}.",
                                style: regular.copyWith(
                                  fontSize: 14,
                                )),
                            SizedBox(height: 4),
                            Row(children: [
                              SvgPicture.asset(
                                "assets/icons/Bold/Location.svg",
                                color: Colors.red,
                                height: 18,
                                width: 18,
                              ),
                              SizedBox(width: 8),
                              Text("${state.member.data.namaKabupaten}",
                                  style: regular.copyWith(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.65),
                                  ))
                            ]),
                            if (!state.member.data.myFriend.berteman)
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {},
                                      child: Text("Follow"),
                                    ),
                                    MaterialButton(
                                      onPressed: () {},
                                      child: Text("Add Friend"),
                                    ),
                                  ]),
                          ],
                        ),
                      )
                    : LinearProgressIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopBar() {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 27, left: 20),
          child: SvgPicture.asset("assets/icons/back_arrow.svg"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 27, left: 15),
          child: Text("Falah.Athy",
              style: bold.copyWith(
                fontSize: 18,
              )),
        ),
      ],
    );
  }
}
