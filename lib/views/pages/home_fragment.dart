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
                              context.bloc<SliderBloc>().add(LoadSlider(widget.tokenResult.data.token));
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
                Expanded(child: SearchBar()),
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
                SvgPicture.asset(
                  "assets/icons/Bold/Message.svg",
                  color: (scrollPositions != 0) ? Colors.grey : Colors.white,
                  height: 22,
                  width: 22,
                ),
                SizedBox(
                  width: 12,
                ),
                SvgPicture.asset(
                  "assets/icons/Bold/Notification.svg",
                  color: (scrollPositions != 0) ? Colors.grey : Colors.white,
                  height: 22,
                  width: 22,
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
