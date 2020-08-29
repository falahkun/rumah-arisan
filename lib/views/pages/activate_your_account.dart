part of 'pages.dart';

class ActivateYourAccountPage extends StatefulWidget {
  final String token;
  final UserData model;

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
  String selectedValue;

  @override
  initState() {
    super.initState();
    if (widget.model != null) {
      setState(() {
        _fullname.text = widget.model.nama;
        _gender.text = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<UserBloc>()
        .add(LoadUser(widget.model.memberToken, widget.model.kode));
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return false;
      },
      child: Scaffold(
        body: BlocBuilder<UserBloc, UserState>(builder: (context, userState) {
          if (userState is OnLoadedUser) {
            // widget.model.nama = userState.user.nama;
            return SafeArea(
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
                            Text("One Step\nMore",
                                style: regular.copyWith(
                                    fontSize: 18, color: Colors.black)),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              enabled: false,
                              controller: TextEditingController(text: userState.user.nama),
                              decoration: InputDecoration(
                                labelText: "Name",
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            DropdownButton(
                              items: _genderList
                                  .map((e) => DropdownMenuItem(
                                        child: Text(e),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (newString) {
                                setState(() {
                                  selectedValue = newString;
                                });
                              },
                              isExpanded: true,
                              itemHeight: 48,
                              value: selectedValue,
                              hint: Text("Select Your Gender",
                                  style: regular.copyWith(
                                      color: Colors.black45, fontSize: 14)),
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
                            DateTimePicker(
                              type: DateTimePickerType.date,
                              initialValue: '',
                              firstDate: DateTime(1945),
                              lastDate: DateTime(2100),
                              dateLabelText: 'Tanggal Lahir',
                              onChanged: (val) => _birthDate.text = val,
                              dateMask: 'd-MM-yyyy',
                              validator: (val) {
                                print(val);
                                return null;
                              },
                              onSaved: (val) => _birthDate.text = val,
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
                          widget.model.nama = userState.user.nama;
                          widget.model.jenisKelamin =
                              selectedValue == _genderList[0] ? "L" : "P";
                          widget.model.tempatLahir = _birthPlace.text;
                          widget.model.tanggalLahir = _birthDate.text;

                          print(widget.model.toJson());

                          context.bloc<PageBloc>().add(GoToCompletingActivating(widget.model));
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
            );
          } else if (userState is OnErrorUser) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(flex: 1,),
                  Text("Oops...", style: bold.copyWith(fontSize: 28),),
                  SizedBox(height: 45,),
                  Image.asset("assets/images/404_v2.png", width: 230, fit: BoxFit.cover,),
                  SizedBox(
                    height: 25,
                  ),
                  Text("message : \n"+userState.message, style: regular.copyWith(
                    fontSize: 18
                  ), textAlign: TextAlign.center,),
                  Spacer(flex: 1,),
                ],
              ),
            );
          } else {
            return Container(
              color: Colors.blue,
            );
          }
        }),
      ),
    );
  }
}
