part of 'pages.dart';

class HomePage extends StatelessWidget {
  final TokenResult tokenResult;

  const HomePage({Key key, this.tokenResult}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(tokenResult.data.foto.toString());
    AuthServices.getSavedImage(tokenResult.data.nama.trim().replaceAll(" ", "_"));
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 60),
            child: Column(
              children: [
                TopBar(
                  title: "Featured",
                  imageUrl: tokenResult.data.foto,
                ),
                SizedBox(
                  height: 18,
                ),
                SearchBar(),
                SizedBox(
                  height: 16,
                ),
                BlocBuilder<SliderBloc, SliderState>(
                    builder: (context, sliderState) =>
                        (sliderState is OnLoadedSlider)
                            ? SliderWidget(
                                sliderResult: sliderState.sliderResult,
                              )
                            : Container())
              ],
            ),
          )
        ],
      ),
    );
  }
}
