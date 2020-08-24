part of 'pages.dart';

class CompletingSignUpPage extends StatefulWidget {
  final RegisterModel registerModel;
  final PageEvent onBackPage;

  const CompletingSignUpPage({Key key, this.registerModel, this.onBackPage})
      : super(key: key);
  @override
  _CompletingSignUpPageState createState() => _CompletingSignUpPageState();
}

class _CompletingSignUpPageState extends State<CompletingSignUpPage> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  File _pickedImage;

  bool nameValid = false;
  bool phoneValid = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.registerModel.password = '';
        widget.registerModel.confirmPassword = '';
        context
            .bloc<PageBloc>()
            .add(GoToSignUpPage(widget.onBackPage, widget.registerModel));
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: GestureDetector(
                                  onTap: () {
                                    widget.registerModel.password = '';
                                    widget.registerModel.confirmPassword = '';
                                    context.bloc<PageBloc>().add(GoToSignUpPage(
                                        widget.onBackPage,
                                        widget.registerModel));
                                  },
                                  child: SvgPicture.asset(
                                      "assets/icons/back_arrow.svg")),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 17.0),
                              child: Text("Hi,\nSign Up",
                                  style: regular.copyWith(
                                      fontSize: 18, color: Colors.black)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text("Choose \nyour profile image",
                                  style: regular.copyWith(
                                      fontSize: 13, color: Colors.black)),
                            ),
                            ClipPath.shape(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                child: Image.asset(
                                  'assets/images/profile_unfilled.png',
                                  height: 70,
                                  width: 70,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _fullNameController,
                          decoration: InputDecoration(
                            labelText: "Full Name",
                          ),
                          onChanged: (value) {
                            setState(() {
                              nameValid = (value.length > 4);
                            });
                          },
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        TextField(
                          keyboardType: TextInputType.phone,
                          controller: _phoneNumberController,
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                phoneValid = true;
                              });
                            }
                          },
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
                    onTap: (nameValid && phoneValid)
                        ? () async {
                            widget.registerModel.name =
                                _fullNameController.text;
                            widget.registerModel.phoneNumber =
                                _phoneNumberController.text;
                            widget.registerModel.profileImage = _pickedImage;
                            context.bloc<PageBloc>().add(
                                GoToCompletingSignUpPage(
                                    widget.onBackPage, widget.registerModel));
                          }
                        : () {},
                    child: Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                          color: (nameValid && phoneValid)
                              ? Color(0xFFFD6585)
                              : Colors.grey,
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
