part of 'widgets.dart';

class SplashItem extends StatelessWidget {
  final String title;
  final String body;
  final String imageUrl;

  const SplashItem({Key key, this.title = "", this.body, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 74.0, left: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toUpperCase(),
                style: bold.copyWith(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                body ?? "",
                style: regular.copyWith(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
