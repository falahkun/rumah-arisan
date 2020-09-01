part of 'pages.dart';

class HomeFragment extends StatelessWidget {
  final TokenResult tokenResult;

  const HomeFragment({Key key, this.tokenResult}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(tokenResult.data.foto.toString());
    AuthServices.getSavedImage(
        tokenResult.data.nama.trim().replaceAll(" ", "_"));
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(children: [
            BlocBuilder<SliderBloc, SliderState>(
                builder: (_, sliderState) => (sliderState is OnLoadedSlider)
                    ? SliderWidget(sliderResult: sliderState.sliderResult,)
                    : Container()),
            SafeArea(
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
                    color: Colors.white,
                    height: 22,
                    width: 22,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  SvgPicture.asset(
                    "assets/icons/Bold/Message.svg",
                    color: Colors.white,
                    height: 22,
                    width: 22,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  SvgPicture.asset(
                    "assets/icons/Bold/Notification.svg",
                    color: Colors.white,
                    height: 22,
                    width: 22,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ))
          ]),
        ],
      ),
    ));
  }
}
