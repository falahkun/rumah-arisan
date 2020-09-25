part of 'widgets.dart';

class MError extends StatelessWidget {
  final String message;

  const MError({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height - 69).toDouble(),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              "assets/images/404.png",
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            message,
            style: regular.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
