part of 'pages.dart';

class ActivateYourAccountPage extends StatefulWidget {
  final String token;
  final UserModel model;

  const ActivateYourAccountPage({Key key, this.token, this.model})
      : super(key: key);
  @override
  _ActivateYourAccountPageState createState() =>
      _ActivateYourAccountPageState();
}

class _ActivateYourAccountPageState extends State<ActivateYourAccountPage> {
  TextEditingController _fullname = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _birthPlace = TextEditingController();
  TextEditingController _birthDate = TextEditingController();

  List<String> _genderList = ["Laki-Laki", "Perempuan"];

  @override
  initState() {
    super.initState();
    if (widget.model != null) {
      setState(() {
        _fullname.text = widget.model.data.nama;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    context.bloc<AuthBloc>().add(GetToken(widget.token));
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return false;
      },
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) => (authState is OnLoadedToken)
              ? SafeArea(
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 27,
                                ),
                                Text("Hi,\nSign Up",
                                    style: regular.copyWith(
                                        fontSize: 18, color: Colors.black)),
                                SizedBox(
                                  height: 30,
                                ),
                                TextField(
                                  controller: _fullname,
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                DropdownButton(
                                  items: _genderList
                                      .map((e) =>
                                          DropdownMenuItem(child: Text(e)))
                                      .toList(),
                                  onChanged: (newString) {
                                    setState(() {
                                      _gender.text = newString;
                                    });
                                  },
                                  isExpanded: true,
                                  itemHeight: 48,
                                  value: _gender.text,
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                TextField(
                                  controller: _birthPlace,
                                  decoration: InputDecoration(
                                    labelText: "Tempat Lahir",
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                TextField(
                                  controller: _birthDate,
                                  decoration: InputDecoration(
                                    labelText: "Tanggal Lahir",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (MediaQuery.of(context).viewInsets.bottom == 0)
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 75,
                            width: double.infinity,
                            color: Color(0xFFC4C4C4),
                          ),
                        ),
                      if (MediaQuery.of(context).viewInsets.bottom == 0)
                        Positioned(
                          right: 20,
                          bottom: 45,
                          child: GestureDetector(
                            onTap: () async {
                              widget.model.data.nama = _fullname.text;
                              widget.model.data.jenisKelamin =
                                  _gender.text == _genderList[0] ? "L" : "P";
                              widget.model.data.tempatLahir = _birthPlace.text;
                              widget.model.data.tanggalLahir = _birthDate.text;
                            },
                            child: Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFD6585),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Icon(
                                Icons.arrow_forward,
                                size: 38,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      if (MediaQuery.of(context).viewInsets.bottom == 0)
                        Positioned(
                          bottom: 92,
                          left: 20,
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Text(
                              "Already Have Account ? ",
                              style: regular.copyWith(
                                  fontSize: 12, color: Colors.black),
                            ),
                            Text("Sign In",
                                style: bold.copyWith(
                                    fontSize: 12, color: Colors.black))
                          ]),
                        )
                    ],
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
