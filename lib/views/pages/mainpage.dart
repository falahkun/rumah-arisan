part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: FlatButton(
          child: Text("Sign Out"),
          onPressed: () {
            AuthServices.removeSession();
            context.bloc<PageBloc>().add(GoToSplashPage());
          },
        )),
      ),
    );
  }
}
