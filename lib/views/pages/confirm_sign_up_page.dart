part of 'pages.dart';

class ConfirmSignUpPage extends StatefulWidget {
  final PageEvent onBackPage;
  final RegisterModel registerModel;

  const ConfirmSignUpPage({Key key, this.onBackPage, this.registerModel})
      : super(key: key);
  @override
  _ConfirmSignUpPageState createState() => _ConfirmSignUpPageState();
}

class _ConfirmSignUpPageState extends State<ConfirmSignUpPage> {
  bool _isTasking = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(
            GoToCompletingSignUpPage(widget.onBackPage, widget.registerModel));
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToCompletingSignUpPage(
                              widget.onBackPage, widget.registerModel));
                        },
                        child: SvgPicture.asset("assets/icons/back_arrow.svg")),
                  ],
                ),
                SizedBox(
                  height: 19,
                ),
                Text(
                  "Confirm\nYour Account",
                  textAlign: TextAlign.center,
                  style: regular.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 22,
                ),
                ClipPath.shape(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  child: widget.registerModel.profileImage != null
                      ? Image.file(widget.registerModel.profileImage,
                          height: 130, width: 130, fit: BoxFit.cover)
                      : Image.asset("assets/images/profile_unfilled.png",
                          height: 130, width: 130, fit: BoxFit.cover),
                ),
                SizedBox(height: 18),
                Text(
                  widget.registerModel.name ?? "Its Your Name",
                  style: regular.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  widget.registerModel.email ?? "youremail@domain.com",
                  style: regular.copyWith(fontSize: 14, color: Colors.black45),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 39,
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      _isTasking = true;
                    });
                    await AuthServices.signUp(widget.registerModel)
                        .then((value) {
                      if (value.status) {
                        AuthServices.saveImagePicture(widget.registerModel.name,
                            widget.registerModel.profileImage);
                        context.bloc<PageBloc>().add(GoToSuccessPage(true));
                      } else {
                        Flushbar(
                          message: value.message,
                          animationDuration: Duration(milliseconds: 500),
                          duration: Duration(seconds: 2),
                          backgroundColor: Color(0xFFFF1267),
                          flushbarPosition: FlushbarPosition.TOP,
                        ).show(context);
                      }
                      _isTasking = false;
                    });

                    setState(() {});
                  },
                  child: _isTasking ? Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Color(0xFFFD6585),
                      borderRadius: BorderRadius.circular(6),
                    ),child: CupertinoActivityIndicator()) : Container(
                    height: 45,
                    width: 240,
                    decoration: BoxDecoration(
                      color: Color(0xFFFD6585),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        "Create Account",
                        style:
                            regular.copyWith(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    "Already Have Account ? ",
                    style: regular.copyWith(fontSize: 12, color: Colors.black),
                  ),
                  Text("Sign In",
                      style: bold.copyWith(fontSize: 12, color: Colors.black))
                ]),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
