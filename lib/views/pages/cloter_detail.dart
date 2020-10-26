part of 'pages.dart';

class CloterDetail extends StatefulWidget {
  final String memberToken;
  final String slug;
  final CloterDetailResult cloterData;

  const CloterDetail({Key key, this.memberToken, this.slug, this.cloterData})
      : super(key: key);
  @override
  _CloterDetailState createState() => _CloterDetailState();
}

class _CloterDetailState extends State<CloterDetail> {
  @override
  Widget build(BuildContext context) {
    context.bloc<CmemberBloc>().add(LoadCMember(widget.slug));
    context
        .bloc<CdetailBloc>()
        .add(LoadCDetail(widget.slug, widget.memberToken));
    print("token = ${widget.memberToken}");
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        context.bloc<CdetailBloc>().add(null);
        return false;
      },
      child: Scaffold(
        body: BlocBuilder<CdetailBloc, CdetailState>(builder: (_, cdState) {
          if (cdState is OnLoadedCdetail) {
            print(cdState.cloterResult.cdetailData.nama);
            return Stack(
              children: [
                /// Tag Untuk Body
                SafeArea(
                  child: (cdState.cloterResult.cdetailData == null)
                      ? Center(child: Text("Why is Null ?"))
                      : ListView(
                          children: [
                            Image.network(
                                cdState.cloterResult.cdetailData.foto.isEmpty
                                    ? placeHolderImageUrl(
                                        cdState.cloterResult.cdetailData.nama)
                                    : cdState.cloterResult.cdetailData.foto
                                        .first.foto,
                                width: MediaQuery.of(context).size.width,
                                height: 338,
                                fit: BoxFit.cover),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30.0),
                                    child: Text(
                                      cdState.cloterResult.cdetailData.nama ??
                                          "-",
                                      style: bold.copyWith(
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Routes.memberPage,
                                              arguments: MemberPageArguments(
                                                  slug: cdState.cloterResult
                                                      .cdetailData.slugOwner));
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ClipPath.shape(
                                                shape: CircleBorder(),
                                                child: Image.asset(
                                                  "assets/images/profile_unfilled.png",
                                                  fit: BoxFit.cover,
                                                  height: 35,
                                                  width: 35,
                                                )),
                                            SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                    cdState
                                                            .cloterResult
                                                            .cdetailData
                                                            .namaOwner ??
                                                        '-',
                                                    style: bold.copyWith(
                                                        fontSize: 12)),
                                                Text(
                                                  cdState
                                                          .cloterResult
                                                          .cdetailData
                                                          .namaKabupaten ??
                                                      "-",
                                                  style: regular.copyWith(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      FlatButton(
                                        child: Row(
                                          children: [
                                            Icon(Icons.add),
                                            SizedBox(width: 5),
                                            Text("Follow")
                                          ],
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),

                                  /// Tag Untuk Deskripsi Arisan
                                  Padding(
                                    padding: EdgeInsets.only(right: 2),
                                    child: Text(cdState
                                        .cloterResult.cdetailData.deskripsi),
                                  ),

                                  /// Info Arisan
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Info\nArisan",
                                          style: bold.copyWith(
                                              fontSize: 14,
                                              color: Colors.grey)),
                                      RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "Type\n",
                                              style: regular.copyWith(
                                                  fontSize: 14,
                                                  color: Colors.black)),
                                          TextSpan(
                                              text: cdState.cloterResult
                                                      .cdetailData.tipe ??
                                                  "-",
                                              style: regular.copyWith(
                                                  fontSize: 14,
                                                  color: Colors.grey)),
                                        ]),
                                      ),
                                      RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "Sistem\n",
                                              style: regular.copyWith(
                                                  fontSize: 14,
                                                  color: Colors.black)),
                                          TextSpan(
                                              text: cdState.cloterResult
                                                  .cdetailData.sistem,
                                              style: regular.copyWith(
                                                  fontSize: 14,
                                                  color: Colors.grey)),
                                        ]),
                                      ),
                                      RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "Golongan\n",
                                              style: regular.copyWith(
                                                  fontSize: 14,
                                                  color: Colors.black)),
                                          TextSpan(
                                              text: cdState.cloterResult
                                                      .cdetailData.private
                                                  ? "Private"
                                                  : "Umum",
                                              style: regular.copyWith(
                                                  fontSize: 14,
                                                  color: Colors.grey)),
                                        ]),
                                      )
                                    ],
                                  ),

                                  /// Tag untuk menampilkan member
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Text("Members",
                                      style: regular.copyWith(
                                        fontSize: 14,
                                      )),
                                  SizedBox(
                                    height: 13,
                                  ),
                                  BlocBuilder<CmemberBloc, CMemberState>(
                                      builder: (_, memberState) => (memberState
                                              is OnLoadedCMember)
                                          ? Container(
                                              child: ListView(
                                                children: List.generate(
                                                    memberState.memberResult
                                                        .data.length,
                                                    (index) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 15.0),
                                                          child: ClipPath.shape(
                                                              shape:
                                                                  CircleBorder(),
                                                              child:
                                                                  Image.network(
                                                                memberState
                                                                    .memberResult
                                                                    .data[index]
                                                                    .foto,
                                                                height: 30,
                                                                width: 30,
                                                                fit: BoxFit
                                                                    .cover,
                                                              )),
                                                        )),
                                                scrollDirection:
                                                    Axis.horizontal,
                                              ),
                                              height: 30,
                                            )
                                          : Container())
                                ],
                              ),
                            )
                          ],
                        ),
                ),

                /// Tag Untuk AppBar
                Container(
                  height: 95,
                  decoration: BoxDecoration(
                      // color: (scrollPositions != 0) ? Colors.white : Colors.transparent,
                      // boxShadow: (scrollPositions != 0) ? [
                      //   BoxShadow(
                      //       offset: Offset(0, 2),
                      //       spreadRadius: 4,
                      //       blurRadius: 4,
                      //       color: Colors.black12
                      //   ),
                      // ] : []
                      ),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, top: 27),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          context.bloc<CdetailBloc>().add(null);
                        },
                        child: SvgPicture.asset("assets/icons/back_arrow.svg"),
                      ),
                    ),
                  ),
                  alignment: Alignment.topLeft,
                ),

                /// Tag Untuk Bottom Nav Bar
                if (!cdState.cloterResult.cdetailData.joined)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/Bold/Chat.svg",
                                color: Color(0xFF2C98F0),
                              ),
                              Text("Chat")
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/Bold/Discovery.svg",
                                color: Color(0xFF2C98F0),
                              ),
                              Text("Discuss")
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              child: Text("Join Arisan",
                                  style: bold.copyWith(
                                      fontSize: 16, color: Colors.white)),
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Color(0xFFDD4C40),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            spreadRadius: 4,
                            offset: Offset(0, 1),
                            color: Colors.black12),
                      ]),
                    ),
                  ),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
