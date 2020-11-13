part of 'widgets.dart';

class TopSetting extends StatelessWidget {
  final Function onTap;

  const TopSetting({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26.0, left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "My Account",
            style: bold.copyWith(
              fontSize: 23,
            ),
          ),
          GestureDetector(
            onTap: () => Get.back(),
            child: SvgPicture.asset("assets/icons/Light/Setting.svg"),
          )
        ],
      ),
    );
  }
}
