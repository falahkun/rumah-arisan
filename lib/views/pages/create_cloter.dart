part of 'pages.dart';

class CreateCloter extends StatefulWidget {
  final String memberToken;
  final CloterData cloter;

  const CreateCloter({Key key, this.memberToken, this.cloter})
      : super(key: key);
  @override
  _CreateCloterState createState() => _CreateCloterState();
}

class _CreateCloterState extends State<CreateCloter> {
  File imageProfile;
  String imageN;
  String arisanTypeSelected, arisanSystemSelected;
  bool isPrivate = false;
  bool isProcessing = false;
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _quota = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            TopBar(
              onTap: () {
                Navigator.pop(context);
              },
              title: "Create\nCloter",
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  if (imageProfile != null)
                    GestureDetector(
                        onTap: () async {
                          File _pickedImage = await pickImage();
                          setState(() {
                            if (_pickedImage != null) {
                              imageProfile = _pickedImage;
                              imageN = null;
                            }
                          });
                        },
                        child: Image.file(imageProfile, width: 80, height: 80))
                  else if (imageN != null)
                    GestureDetector(
                        onTap: () async {
                          File _pickedImage = await pickImage();
                          setState(() {
                            if (_pickedImage != null) {
                              imageProfile = _pickedImage;
                              imageN = null;
                            }
                          });
                        },
                        child: Image.network(imageN, width: 80, height: 80))
                  else
                    Container(
                        child: Center(
                            child: IconButton(
                          icon: Icon(Icons.add_a_photo),
                          onPressed: () async {
                            File _pickedImage = await pickImage();
                            setState(() {
                              if (_pickedImage != null) {
                                imageProfile = _pickedImage;

                                imageN = null;
                              }
                            });
                          },
                        )),
                        color: Colors.blue.withOpacity(0.25),
                        width: 80,
                        height: 80),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _title,
                    style: regular.copyWith(fontSize: 14),
                    decoration: InputDecoration(
                        hintText: "Input your cloter name",
                        hintStyle: regular.copyWith(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.65))),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: _description,
                    minLines: 8,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: regular.copyWith(fontSize: 14),
                    decoration: InputDecoration(
                        hintText: "Input your cloter description",
                        hintStyle: regular.copyWith(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.65))),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: _quota,
                    style: regular.copyWith(fontSize: 14),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Input your max quota of members",
                        hintStyle: regular.copyWith(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.65))),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.black45)),
                    width: MediaQuery.of(context).size.width - 40,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          value: arisanTypeSelected,
                          isExpanded: true,
                          hint: Text("Select Arisan type",
                              style: regular.copyWith(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.65))),
                          items: _arisanType
                              .map((e) => DropdownMenuItem(
                                    value: e.value,
                                    // onTap: () {
                                    //   setState(() {
                                    //     arisanTypeSelected = e;
                                    //   });
                                    // },
                                    child: Text(e.title,
                                        style: regular.copyWith(fontSize: 14)),
                                  ))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              arisanTypeSelected = val;
                            });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.black45)),
                    width: MediaQuery.of(context).size.width - 40,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          value: arisanSystemSelected,
                          isExpanded: true,
                          hint: Text("Select Arisan System",
                              style: regular.copyWith(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.65))),
                          items: _arisanSystem
                              .map((e) => DropdownMenuItem(
                                    value: e.value,
                                    // onTap: () {
                                    //   setState(() {
                                    //     arisanTypeSelected = e;
                                    //   });
                                    // },
                                    child: Text(e.title,
                                        style: regular.copyWith(fontSize: 14)),
                                  ))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              arisanSystemSelected = val;
                            });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CheckboxListTile(
                    value: isPrivate,
                    contentPadding: EdgeInsets.only(left: 0),
                    onChanged: (nv) {
                      setState(() {
                        isPrivate = nv;
                      });
                    },
                    title: Text("make it a private cloter"),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  GestureDetector(
                    onTap: (widget.cloter != null)
                        ? () async {
                            setState(() {
                              isProcessing = true;
                            });
                            CloterData _cloterData = CloterData();
                            _cloterData.id = widget.cloter.id;
                            _cloterData.nama = _title.text.trim();
                            _cloterData.deskripsi = _description.text.trim();
                            _cloterData.kuota = _quota.text.trim();
                            _cloterData.foto = (imageProfile != null)
                                ? await fileToBase64(imageProfile)
                                : "";
                            _cloterData.private = isPrivate;

                            await CloterServices.updateCloter(
                                    widget.memberToken, _cloterData)
                                .then((value) {
                              if (value.status) {
                                isProcessing = false;
                                Navigator.pop(context);
                                context
                                    .bloc<MCBloc>()
                                    .add(FetchMCommunities(widget.memberToken));
                              } else {
                                isProcessing = false;
                                Flushbar(
                                  message: value.message,
                                  animationDuration: Duration(seconds: 2),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Color(0xFFFF1267),
                                  flushbarPosition: FlushbarPosition.TOP,
                                ).show(context);
                              }
                            });
                            setState(() {});
                          }
                        : (_title.text.isEmpty && _description.text.isEmpty)
                            ? () {
                                Flushbar(
                                  message: "Title & description can't be null!",
                                  animationDuration: Duration(seconds: 2),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Color(0xFFFF1267),
                                  flushbarPosition: FlushbarPosition.TOP,
                                ).show(context);
                              }
                            : () async {
                                setState(() {
                                  isProcessing = true;
                                });
                                CloterData _cloterData = CloterData();
                                _cloterData.nama = _title.text.trim();
                                _cloterData.kuota = _quota.text;
                                _cloterData.tipe = arisanTypeSelected;
                                _cloterData.sistem = arisanSystemSelected;
                                _cloterData.deskripsi =
                                    _description.text.trim();
                                _cloterData.foto = (imageProfile != null)
                                    ? await fileToBase64(imageProfile)
                                    : "";

                                _cloterData.private = isPrivate;

                                // _description.text =
                                //     _cloterData.toJson().toString();

                                await CloterServices.createCloter(
                                        widget.memberToken, _cloterData)
                                    .then((value) {
                                  if (value.status) {
                                    isProcessing = false;
                                    Navigator.pop(context);
                                    context.bloc<MCBloc>().add(
                                        FetchMCommunities(widget.memberToken));
                                  } else {
                                    isProcessing = false;
                                    _cloterData.foto = "";
                                    print(_cloterData.toJson());
                                    Flushbar(
                                      message: value.message,
                                      animationDuration: Duration(seconds: 2),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: Color(0xFFFF1267),
                                      flushbarPosition: FlushbarPosition.TOP,
                                    ).show(context);
                                  }
                                });
                                setState(() {});
                              },
                    child: Container(
                      height: 45,
                      width: 240,
                      child: Center(
                          child: Text(
                              widget.cloter == null
                                  ? "Create your own Cloter"
                                  : "Update your Cloter",
                              style: regular.copyWith(
                                  fontSize: 13,
                                  color: widget.cloter == null
                                      ? Colors.white
                                      : Colors.black))),
                      decoration: BoxDecoration(
                        color: widget.cloter == null
                            ? Color(0xFF2C98F0)
                            : Colors.amber,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  if (widget.cloter != null)
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          isProcessing = true;
                        });
                        await CloterServices.deleteCloter(
                                widget.memberToken, widget.cloter.id)
                            .then((value) {
                          if (value.status) {
                            isProcessing = false;
                            Navigator.pop(context);
                            context
                                .bloc<MCBloc>()
                                .add(FetchMCommunities(widget.memberToken));
                          } else {
                            isProcessing = false;
                            Flushbar(
                              message: value.message,
                              animationDuration: Duration(seconds: 2),
                              duration: Duration(seconds: 2),
                              backgroundColor: Color(0xFFFF1267),
                              flushbarPosition: FlushbarPosition.TOP,
                            ).show(context);
                          }
                        });
                      },
                      child: Container(
                        height: 45,
                        width: 240,
                        child: Center(
                            child: Text("Delete Community",
                                style: regular.copyWith(
                                    fontSize: 13, color: Colors.white))),
                        decoration: BoxDecoration(
                          color: Color(0xFFFD6585),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  String title;
  String value;

  Item(this.title, this.value);
}

List<Item> _arisanType = [
  Item("Uang", "Uang"),
  Item("Barang", "Barang"),
];
List<Item> _arisanSystem = [
  Item("Kocok", "Kocok"),
  Item("Menurun", "Menurun"),
];
