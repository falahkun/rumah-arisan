import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rumah_arisan/blocs/blocs.dart';
import 'package:rumah_arisan/services/services.dart';
import 'package:rumah_arisan/views/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.accessToken,
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => PageBloc(OnInitialPage()))],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Wrapper(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _counter = "";

  void _incrementCounter() async {
    final res = await AuthServices.signIn("member@gmail.com", "12345678");
    setState(() {
      _counter = res.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    String token = Provider.of<String>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: token != null ? Colors.amber : Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
