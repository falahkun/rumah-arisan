part of 'pages.dart';

class HomeFragment extends StatefulWidget {
  final TokenResult tokenResult;

  const HomeFragment({Key key, this.tokenResult}) : super(key: key);

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment>
    with AutomaticKeepAliveClientMixin {
  ScrollController _controller = ScrollController();
  double scrollPositions = 0;

  @override
  initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        scrollPositions = _controller.position.pixels;
      });
    });
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    print(widget.tokenResult.data.foto.toString());
    AuthServices.getSavedImage(
        widget.tokenResult.data.nama.trim().replaceAll(" ", "_"));
    return Scaffold(
        body: Stack(
      children: [
        ListView(
          controller: _controller,
          addAutomaticKeepAlives: true,
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          children: [
            /// Slider
            Container(
              height: 280 + 24.0,
              width: double.infinity,
              child: BlocBuilder<SliderBloc, SliderState>(
                  builder: (_, sliderState) => (sliderState is OnLoadedSlider)
                      ? SliderWidget(
                          sliderResult: sliderState.sliderResult,
                        )
                      : Container()),
            ),

            /// block code for menu

            /// bloc code for communities
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Community",
                  style: bold.copyWith(
                    fontSize: 18,
                  )),
            ),
            BlocBuilder<CommunitiesBloc, CommunitiesState>(
                builder: (_, state) => (state is OnLoadedCommunities)
                    ? (state.communitiesResult.status)
                        ? Container(
                            height: 118,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                    state.communitiesResult.data.length,
                                    (index) => Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 15,
                                              left: 20,
                                              right: (index + 1) ==
                                                      state.communitiesResult
                                                          .data.length
                                                  ? 20
                                                  : 0),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, Routes.communityPage,
                                                  arguments:
                                                      CommunityPageArguments(
                                                          memberToken:
                                                              widget.tokenResult
                                                                  .data.token,
                                                          slug: state
                                                              .communitiesResult
                                                              .data[index]
                                                              .slug));
                                            },
                                            child: CommunityItem(
                                              isLiked: false,
                                              liked: 2,
                                              privacy: state.communitiesResult
                                                      .data[index].private
                                                  ? "Private"
                                                  : "Public",
                                              rating: 4,
                                              reactedPeople: 1,
                                              title: state.communitiesResult
                                                  .data[index].nama,
                                              urlImage: state.communitiesResult
                                                      .data[index].foto ??
                                                  "https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg",
                                            ),
                                          ),
                                        ))),
                          )
                        : Container(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(state.communitiesResult.message),
                          )
                    : Container(
                        child: LinearProgressIndicator(),
                      )),

            /// bloc code for blog

            /// block code for cloter
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: Text("Arisan", style: bold.copyWith(fontSize: 18)),
            ),
            BlocBuilder<CloterBloc, CloterState>(
                builder: (_, cloterState) => (cloterState is OnLoadedCloter)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ArisanGrid(
                          memberToken: widget.tokenResult.data.token,
                          cloterResult: cloterState.cloterResult,
                        ),
                      )
                    : Container(
                        child: Column(
                          children: [
                            Text("Can't Load Cloter"),
                            MaterialButton(
                              onPressed: () {
                                context.bloc<SliderBloc>().add(
                                    LoadSlider(widget.tokenResult.data.token));
                              },
                              child: Text("Refresh"),
                            ),
                          ],
                        ),
                      )),
            SizedBox(
              height: 65,
            ),
          ],
        ),

        ///block code for appbar
        Container(
          height: 95,
          decoration: BoxDecoration(
              color: (scrollPositions != 0) ? Colors.white : Colors.transparent,
              boxShadow: (scrollPositions != 0)
                  ? [
                      BoxShadow(
                          offset: Offset(0, 2),
                          spreadRadius: 4,
                          blurRadius: 4,
                          color: Colors.black12),
                    ]
                  : []),
          alignment: Alignment.topCenter,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.searchPage,
                              arguments: SearchPageArguments(
                                  memberToken: widget.tokenResult.data.token,
                                  query: "",
                                  slug: "",
                                  currentIndex: 0));
                        },
                        child: Hero(tag: "search-bar", child: SearchBar()))),
                SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(
                  "assets/icons/Bold/Heart.svg",
                  color: (scrollPositions != 0) ? Colors.grey : Colors.white,
                  height: 22,
                  width: 22,
                ),
                SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.messagesPage,
                        arguments: MessagesPageArguments(
                            memberToken: widget.tokenResult.data.token));
                  },
                  child: SvgPicture.asset(
                    "assets/icons/Bold/Message.svg",
                    color: (scrollPositions != 0) ? Colors.grey : Colors.white,
                    height: 22,
                    width: 22,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.notifPage);
                  },
                  child: SvgPicture.asset(
                    "assets/icons/Bold/Notification.svg",
                    color: (scrollPositions != 0) ? Colors.grey : Colors.white,
                    height: 22,
                    width: 22,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          )),
        ),
      ],
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
