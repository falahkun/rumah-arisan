part of 'pages.dart';

class CommunityPage extends StatefulWidget {
  final String slug;
  final String memberToken;

  const CommunityPage({Key key, this.slug, this.memberToken}) : super(key: key);
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  bool isExpandtext = false;
  @override
  Widget build(BuildContext context) {
    context
        .bloc<CommunityBloc>()
        .add(LoadCommunitiy(widget.slug, widget.memberToken));
    return WillPopScope(
      onWillPop: () async {
        context.bloc<CommunityBloc>().add(null);
        return false;
      },
      child: Scaffold(
        body: BlocBuilder<CommunityBloc, CommunityState>(
            builder: (_, communityState) => (communityState
                    is OnLoadedCommunity)
                ? (communityState.communityResult.status)
                    ? SafeArea(
                        child: ListView(
                          padding: EdgeInsets.all(0),
                          children: [
                            Stack(
                              children: [
                                Image.network(
                                  communityState.communityResult.data.banner,
                                  width: MediaQuery.of(context).size.width,
                                  height: 433,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 24, right: 20, left: 20, bottom: 31),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            context
                                                .bloc<CommunityBloc>()
                                                .add(null);
                                            Navigator.pop(context);
                                          },
                                          child: SvgPicture.asset(
                                              "assets/icons/back_arrow.svg")),
                                      Row(
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    Routes.communityDiscussPage,
                                                    arguments:
                                                        CommunityDiscussPageArguments(
                                                            memberToken: widget
                                                                .memberToken,
                                                            slug: widget.slug));
                                              },
                                              child: SvgPicture.asset(
                                                  "assets/icons/Light/Chat.svg")),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          if (communityState
                                              .communityResult.data.join.status)
                                            GestureDetector(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                      context: context,
                                                      builder: (context) {
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            ListTile(
                                                              title: Text(
                                                                  "Leave Community"),
                                                              onTap: () {
                                                                CommunityServices.leftCommunity(
                                                                        communityState
                                                                            .communityResult
                                                                            .data
                                                                            .id,
                                                                        widget
                                                                            .memberToken)
                                                                    .then(
                                                                        (value) {
                                                                  Navigator.pop(
                                                                      context);
                                                                  if (value
                                                                      .status) {
                                                                    Flushbar(
                                                                      message: value
                                                                          .message,
                                                                      animationDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      duration: Duration(
                                                                          seconds:
                                                                              2),
                                                                      backgroundColor:
                                                                          Colors
                                                                              .black,
                                                                      flushbarPosition:
                                                                          FlushbarPosition
                                                                              .TOP,
                                                                    ).show(
                                                                        context);
                                                                  } else {
                                                                    Flushbar(
                                                                      message: value
                                                                          .message,
                                                                      animationDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      duration: Duration(
                                                                          seconds:
                                                                              2),
                                                                      backgroundColor:
                                                                          Color(
                                                                              0xFFFF1267),
                                                                      flushbarPosition:
                                                                          FlushbarPosition
                                                                              .TOP,
                                                                    ).show(
                                                                        context);
                                                                  }
                                                                  context
                                                                      .bloc<
                                                                          CommunityBloc>()
                                                                      .add(LoadCommunitiy(
                                                                          widget
                                                                              .slug,
                                                                          widget
                                                                              .memberToken));
                                                                });
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      });
                                                },
                                                child: Icon(Icons.more_vert)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                top: 20,
                                bottom: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 50.0),
                                    child: Text(
                                        communityState
                                            .communityResult.data.nama,
                                        style: bold.copyWith(
                                          fontSize: 18,
                                        )),
                                  ),
                                  Text(
                                      communityState.communityResult.data.info
                                              .namaKabupaten
                                              .toString() +
                                          "・" +
                                          privacy(communityState
                                              .communityResult.data.private),
                                      style: regular.copyWith(fontSize: 12)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  if (!communityState
                                      .communityResult.data.join.status)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20.0, bottom: 20),
                                      child: GestureDetector(
                                        onTap: () {
                                          CommunityServices.joinCommunity(
                                            communityState
                                                .communityResult.data.id,
                                            widget.memberToken,
                                          ).then((value) {
                                            if (value.status) {
                                              Flushbar(
                                                message: value.message,
                                                animationDuration:
                                                    Duration(milliseconds: 500),
                                                duration: Duration(seconds: 2),
                                                backgroundColor: Colors.black,
                                                flushbarPosition:
                                                    FlushbarPosition.TOP,
                                              ).show(context);

                                              context.bloc<CommunityBloc>().add(
                                                  LoadCommunitiy(widget.slug,
                                                      widget.memberToken));
                                            } else {
                                              Flushbar(
                                                message: value.message,
                                                animationDuration:
                                                    Duration(milliseconds: 500),
                                                duration: Duration(seconds: 2),
                                                backgroundColor:
                                                    Color(0xFFFF1267),
                                                flushbarPosition:
                                                    FlushbarPosition.TOP,
                                              ).show(context);
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          width: double.infinity,
                                          child: Center(
                                            child: Text(
                                              "Join Community",
                                              style: bold.copyWith(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Color(0xFFDD4C40)),
                                        ),
                                      ),
                                    ),
                                  Text(
                                    "${communityState.communityResult.data.totalMember} Members",
                                    style: regular.copyWith(fontSize: 13),
                                  ),
                                  if (communityState.communityResult.data
                                          .members.length !=
                                      0)
                                    SizedBox(height: 15),
                                  if (communityState.communityResult.data
                                          .members.length !=
                                      0)
                                    Container(
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: List.generate(
                                            communityState.communityResult.data
                                                .members.length,
                                            (index) => Padding(
                                                  padding: EdgeInsets.only(
                                                      right: ((index + 1) == 10)
                                                          ? 20
                                                          : 10.0),
                                                  child: Column(
                                                    children: [
                                                      ClipPath.shape(
                                                        shape: CircleBorder(),
                                                        child: Image.network(
                                                          communityState
                                                                  .communityResult
                                                                  .data
                                                                  .members[
                                                                      index]
                                                                  .foto ??
                                                              placeHolderImageUrl(
                                                                  communityState
                                                                      .communityResult
                                                                      .data
                                                                      .nama),
                                                          width: 50,
                                                          height: 50,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 7,
                                                      ),
                                                      Container(
                                                        width: 47,
                                                        child: Text(
                                                          communityState
                                                                  .communityResult
                                                                  .data
                                                                  .members[
                                                                      index]
                                                                  .nama ??
                                                              "Tanizaki Saya",
                                                          style:
                                                              regular.copyWith(
                                                                  fontSize: 9),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                      ),
                                      height: 86,
                                    ),
                                ],
                              ),
                            ),
                            Container(
                                color: Color(0xFFC4C4C4).withOpacity(0.25),
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isExpandtext = !isExpandtext;
                                        });
                                      },
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: expandText(
                                                noHtmlHtmlan(communityState
                                                    .communityResult
                                                    .data
                                                    .deskripsi),
                                                maxLength: 230,
                                                isExpand: isExpandtext),
                                            style: regular.copyWith(
                                                fontSize: 14,
                                                color: Colors.black
                                                    .withOpacity(0.75)),
                                          ),
                                          TextSpan(
                                            text: (isExpandtext)
                                                ? " Show Less"
                                                : " Read more.",
                                            recognizer:
                                                new TapGestureRecognizer()
                                                  ..onTap = () {
                                                    print("1");
                                                  },
                                            style: bold.copyWith(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Feeds",
                                            style: bold.copyWith(fontSize: 16)),
                                        Row(
                                          children: [
                                            Text("see All",
                                                style: regular.copyWith(
                                                    fontSize: 14,
                                                    color: Colors.black
                                                        .withOpacity(0.75))),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 15,
                                              color: Colors.black
                                                  .withOpacity(0.75),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(communityState.communityResult.message),
                            FlatButton(
                              child: Text("Reload"),
                              onPressed: () {
                                context.bloc<CommunityBloc>().add(
                                    LoadCommunitiy(
                                        widget.slug, widget.memberToken));
                              },
                            ),
                          ],
                        ),
                      )
                : Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
