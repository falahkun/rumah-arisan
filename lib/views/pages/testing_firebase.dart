part of 'pages.dart';

class TestingPage extends StatefulWidget {
  @override
  _TestingPageState createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  TextEditingController _subscribeTopic = TextEditingController();
  TextEditingController _unSubscribeTopic = TextEditingController();

  @override
  initState() {
    super.initState();
    FCMServices.subscribeTopic("globals");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi "),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
              style: TextStyle(fontSize: 16, color: Colors.black),
              controller: _subscribeTopic,
              decoration: InputDecoration(labelText: "Subscribe Topic")),
          SizedBox(
            height: 15,
          ),
          MaterialButton(
            onPressed: () {
              FCMServices.subscribeTopic(_subscribeTopic.text);
              Flushbar(
                messageText:
                    Text("Berhasil Subscribe ke ${_subscribeTopic.text}"),
                duration: Duration(seconds: 3),
                flushbarPosition: FlushbarPosition.TOP,
              )..show(context);
            },
            child: Text("Subscribe Topic"),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
              style: TextStyle(fontSize: 16, color: Colors.black),
              controller: _unSubscribeTopic,
              decoration: InputDecoration(labelText: "UnSubscribe Topic")),
          SizedBox(
            height: 15,
          ),
          MaterialButton(
            onPressed: () {
              FCMServices.subscribeTopic(_unSubscribeTopic.text);
              Flushbar(
                messageText:
                    Text("Berhasil UnSubscribe ke ${_unSubscribeTopic.text}"),
                duration: Duration(seconds: 3),
                flushbarPosition: FlushbarPosition.TOP,
              )..show(context);
            },
            child: Text("UnSubscribe Topic"),
          ),
          SizedBox(
            height: 15,
          ),
          Text("global topic sudah ter-subscribe secara otomatis")
        ],
      ),
    );
  }
}
