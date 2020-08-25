part of 'pages.dart';

class ErrorPage extends StatefulWidget {
  final FlutterErrorDetails error;

  const ErrorPage({Key key, @required this.error}) : super(key: key);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Oops!\nSomething Else",
                style: bold.copyWith(
                  fontSize: 23,
                  color: Colors.black.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Image.asset(
                "assets/images/500.png",
                height: 150,
                width: 160.26,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                (widget.error != null)
                    ? widget.error.exceptionAsString()
                    : "testing blablabla\nblablablablablablabalnbakaks\njdajdalkjdakdjakdjal",
                style: regular.copyWith(
                    fontSize: 14, color: Colors.black.withOpacity(0.6)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              GestureDetector(
                onTap: () async {
                  await ReportServices.reportBug(
                      widget.error.exceptionAsString() ?? "");
                },
                child: Container(
                  height: 45,
                  width: 236,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xFFFD6585),
                  ),
                  child: Center(
                    child: Text("Report Bug",
                        style: regular.copyWith(
                            fontSize: 14, color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
