part of 'widgets.dart';

class SliderWidget extends StatefulWidget {
  final SliderResult sliderResult;

  const SliderWidget({Key key, this.sliderResult}) : super(key: key);
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 280 + 24.0,
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.sliderResult == null ||
                widget.sliderResult.status == false)
              Container()
            else
              CarouselSlider(
                  items: List.generate(
                      widget.sliderResult.data.length,
                      (index) => Container(
                            color: Colors.blue,
                            child: Image.network(
                              widget.sliderResult.data[index].bannerM,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 269,
                            ),
                          )),
                  options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      height: 269,
                      initialPage: 0,
                      viewportFraction: 1,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true)),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Row(
                  children: List.generate(
                      widget.sliderResult.data.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Container(
                              height: 7.18,
                              width: 7.18,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (currentIndex == index)
                                      ? Color(0xFF1BA0E2)
                                      : Color(0xFFc4c4c4)),
                            ),
                          )),
                ),
                Spacer(),
                Text(
                  "Lihat Semua Promo",
                  style: bold.copyWith(fontSize: 12, color: Color(0xFF1BA0E2)),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            )
          ],
        ));
  }
}
