part of 'widgets.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String imageIcon;
  final Function onTap;

  const MenuItem({Key key, this.title, this.imageIcon, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: 30,
            child: Image.network(
                imageIcon ?? placeHolderImageUrl(gettingFirstChar(title))),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            isEnteredTitle(title) ? title.replaceAll(" ", "\n") : "\n" + title,
            textAlign: TextAlign.center,
            style: regular.copyWith(fontSize: 14),
          )
        ],
      ),
    );
  }
}
