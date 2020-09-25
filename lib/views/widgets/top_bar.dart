part of 'widgets.dart';

class TopBar extends StatelessWidget {
  final String title;
  final Function onTap;

  const TopBar({Key key, this.title, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69,
      // color: Colors.blue,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
              top: 27,
              left: 20,
              child: GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset("assets/icons/back_arrow.svg"))),
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: regular.copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
