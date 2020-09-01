part of 'widgets.dart';

class Sliderv1Widget extends StatefulWidget {
  final ScrollController scrollController;
  final SliderResult sliderResult;

  const Sliderv1Widget({Key key, this.sliderResult, this.scrollController}) : super(key: key);

  @override
  _Sliderv1WidgetState createState() => _Sliderv1WidgetState();
}

class _Sliderv1WidgetState extends State<Sliderv1Widget> {
  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
  }

  void _animateSlider() {
    Future.delayed(Duration(seconds: 5)).then(
      (_) {
        int nextPage = _pageController.page.round() + 1;

        if (nextPage == widget.sliderResult.data.length) {
          nextPage = 0;
        }

        _pageController
            .animateToPage(nextPage,
                duration: Duration(milliseconds: 300), curve: Curves.easeIn)
            .then(
              (_) => _animateSlider(),
            );
      },
    );
  }

  @override
  dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(6), boxShadow: [
        BoxShadow(
            blurRadius: 6,
            spreadRadius: 1,
            offset: Offset(0, 0),
            color: Colors.black.withOpacity(0.1)),
      ]),
      height: 269,
      child: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            controller: _pageController,
            children: List.generate(
                (widget.sliderResult == null ||
                        widget.sliderResult.status == false)
                    ? 3
                    : widget.sliderResult.data.length,
                (index) => ClipPath.shape(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: (widget.sliderResult == null ||
                            widget.sliderResult.status == false)
                        ? Container(
                            height: double.infinity,
                            width: double.infinity,
                            color: Colors.pink,
                          )
                        : Image.network(
                            widget.sliderResult.data[index].banner,
                            height: 123.01,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ))),
          ),
          Positioned(
            bottom: 6.73,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  (widget.sliderResult == null ||
                          widget.sliderResult.status == false)
                      ? 3
                      : widget.sliderResult.data.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Container(
                          height: 7.18,
                          width: 7.18,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (index == currentPage)
                                  ? Color(0xFF1BA0E2)
                                  : Color(0xFFC4C4C4)),
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
