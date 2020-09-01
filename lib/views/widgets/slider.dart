part of 'widgets.dart';

class SliderWidget extends StatefulWidget {
  final SliderResult sliderResult;

  const SliderWidget({Key key, this.sliderResult}) : super(key: key);
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 269 + 24.0,
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider(
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
                height: 269,
                initialPage: 0,
                viewportFraction: 1,
                scrollDirection: Axis.horizontal,
                autoPlay: true)));
  }
}
