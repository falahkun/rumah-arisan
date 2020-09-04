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
    context
        .bloc<CdetailBloc>()
        .add(LoadCDetail(widget.slug, widget.memberToken));
    print("token = ${widget.memberToken}");
    return Scaffold(
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
                              cdState.cloterResult.cdetailData.foto.first.foto,
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
                                    cdState.cloterResult.cdetailData.nama ?? "-",
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
                                            cdState.cloterResult.cdetailData
                                                    .namaOwner ??
                                                '-',
                                            style: bold.copyWith(fontSize: 12)),
                                        Text(
                                          cdState.cloterResult.cdetailData
                                                  .namaKabupaten ??
                                              "-",
                                          style: regular.copyWith(fontSize: 10),
                                        ),
                                      ],
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
                                  child: Text(""),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
              ),

              /// Tag Untuk
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
                        context.bloc<PageBloc>().add(GoToMainPage(0));
                      },
                      child: SvgPicture.asset("assets/icons/back_arrow.svg"),
                    ),
                  ),
                ),
                alignment: Alignment.topLeft,
              )
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}
