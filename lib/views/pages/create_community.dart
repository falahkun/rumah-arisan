part of 'pages.dart';

class CreateCommunity extends StatefulWidget {
  final String memberToken;

  const CreateCommunity({Key key, this.memberToken}) : super(key: key);
  @override
  _CreateCommunityState createState() => _CreateCommunityState();
}

class _CreateCommunityState extends State<CreateCommunity> {
  File imageProfile, imageBanner;
  bool isPrivate = false;
  bool isProcessing = false;
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _note = TextEditingController();

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
            title: "Create\nCommunity",
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (imageProfile != null)
                    Image.file(imageProfile, width: 80, height: 80)
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
                              }
                            });
                          },
                        )),
                        color: Colors.blue.withOpacity(0.25),
                        width: 80,
                        height: 80),
                  if (imageBanner != null)
                    Image.file(imageBanner,
                        width: MediaQuery.of(context).size.width / 3,
                        height: 433 / 3)
                  else
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: 433 / 3,
                      color: Colors.blue.withOpacity(0.25),
                      child: Center(
                          child: IconButton(
                        icon: Icon(Icons.add_a_photo),
                        onPressed: () async {
                          File _pickedImage = await pickImage();
                          setState(() {
                            if (_pickedImage != null) {
                              imageBanner = _pickedImage;
                            }
                          });
                        },
                      )),
                    ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text("Image Profile"), Text("Image Banner")],
              ),
            ],
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                TextField(
                  controller: _title,
                  style: regular.copyWith(fontSize: 14),
                  decoration: InputDecoration(
                      hintStyle: regular.copyWith(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.65),
                      ),
                      hintText: "Community Title"),
                ),
                Container(
                  height: 125,
                  alignment: Alignment.topCenter,
                  child: TextField(
                    controller: _description,
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    decoration: InputDecoration(
                        hintStyle: regular.copyWith(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.65),
                        ),
                        hintText: "Description"),
                  ),
                ),
                Container(
                  height: 125,
                  alignment: Alignment.topCenter,
                  child: TextField(
                    controller: _note,
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    decoration: InputDecoration(
                        hintStyle: regular.copyWith(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.65),
                        ),
                        hintText: "note"),
                  ),
                ),
                CheckboxListTile(
                  value: isPrivate,
                  contentPadding: EdgeInsets.only(left: 0),
                  onChanged: (nv) {
                    setState(() {
                      isPrivate = nv;
                    });
                  },
                  title: Text("make it a private community"),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                GestureDetector(
                  onTap: (_title.text.isEmpty && _description.text.isEmpty)
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
                          CommunityData _communityData = CommunityData();
                          _communityData.nama = _title.text.trim();
                          _communityData.catatan = _note.text.trim();
                          _communityData.deskripsi = _description.text.trim();
                          _communityData.banner = (imageBanner != null)
                              ? await fileToBase64(imageBanner)
                              : "";
                          _communityData.foto = (imageProfile != null)
                              ? await fileToBase64(imageProfile)
                              : "";

                          await CommunityServices.createCommunity(
                                  widget.memberToken, _communityData)
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
                        },
                  child: Container(
                    height: 45,
                    width: 240,
                    child: Center(
                        child: Text("Create your own community",
                            style: regular.copyWith(
                                fontSize: 13, color: Colors.white))),
                    decoration: BoxDecoration(
                      color: Color(0xFF2C98F0),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
