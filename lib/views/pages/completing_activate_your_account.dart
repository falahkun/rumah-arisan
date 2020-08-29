part of 'pages.dart';

class CompletingActivatePage extends StatefulWidget {
  final UserData model;

  const CompletingActivatePage({Key key, this.model}) : super(key: key);
  @override
  _CompletingActivatePageState createState() => _CompletingActivatePageState();
}

class _CompletingActivatePageState extends State<CompletingActivatePage> {
  TextEditingController _kecamatan = TextEditingController();
  TextEditingController _alamat = TextEditingController();
  TextEditingController _kodePos = TextEditingController();

  String kecamatanId;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(
            GoToActivateYourAccount(widget.model.memberToken, widget.model));
        return false;
      },
      child: Scaffold(
        body: SafeArea(
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
                        Text("Tell\nYour Personal Info",
                            style: regular.copyWith(
                                fontSize: 18, color: Colors.black)),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: _kecamatan,
                          decoration: InputDecoration(
                            labelText: "Kecamatan",
                          ),
                          onChanged: (value) {
                            context
                                .bloc<SubdistrictBloc>()
                                .add(LoadSubdistricts(query: value));
                          },
                          onSubmitted: (value) {
                            context
                                .bloc<SubdistrictBloc>()
                                .add(LoadSubdistricts(query: value));
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<SubdistrictBloc, SubdistrictState>(
                          builder: (context, subState) => (subState
                                  is OnLoadedSubdistrict)
                              ? Container(
                                  height: 45,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: subState.subdistricts
                                        .map((e) => Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _kecamatan.text = e.nama;
                                                    kecamatanId =
                                                        e.id.toString();
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            blurRadius: 4,
                                                            spreadRadius: 4,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.1),
                                                            offset:
                                                                Offset(0, 0)),
                                                      ]),
                                                  width: 200,
                                                  height: 45,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5,
                                                          left: 10,
                                                          right: 10),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(e.nama,
                                                          style:
                                                              regular.copyWith(
                                                                  fontSize:
                                                                      12)),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text(e.kodePos,
                                                          style:
                                                              regular.copyWith(
                                                                  fontSize: 8)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                )
                              : Container(),
                        ),
                        SizedBox(height: 10),
                        Divider(),
                        Container(
                          height: 125,
                          alignment: Alignment.topCenter,
                          child: TextField(
                            controller: _alamat,
                            expands: true,
                            maxLines: null,
                            minLines: null,
                            decoration: InputDecoration(
                              labelText: "Alamat",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        TextField(
                          controller: _kodePos,
                          decoration: InputDecoration(
                            labelText: "Kode Pos",
                          ),
                        ),
                        SizedBox(
                          height: 18,
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
                      widget.model.kecamatanId = kecamatanId;
                      widget.model.kodePos = _kodePos.text;
                      widget.model.alamat = _alamat.text;

                      print(widget.model.toJson());

                      await AuthServices.putUser(widget.model).then((value) {
                        if (value[true]) {
                          context.bloc<PageBloc>().add(GoToSuccessPage(
                                false,
                              ));
                        } else {
                          context.bloc<PageBloc>().add(
                              GoToSuccessPage(false, message: value[false]));
                        }
                      });
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
                      style:
                          regular.copyWith(fontSize: 12, color: Colors.black),
                    ),
                    Text("Sign In",
                        style: bold.copyWith(fontSize: 12, color: Colors.black))
                  ]),
                )
            ],
          ),
        ),
      ),
    );
  }
}
