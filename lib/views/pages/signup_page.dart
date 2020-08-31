part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final PageEvent onBackPage;
  final RegisterModel registerModel;

  const SignUpPage({Key key, this.onBackPage, this.registerModel})
      : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool emailValid = false;
  bool passwordValid = false;
  bool confirmPasswordValid = false;

  @override
  initState() {
    super.initState();
    _emailController.text = widget.registerModel.email ?? '';
    _passwordController.text = widget.registerModel.password ?? '';
    _confirmPasswordController.text =
        widget.registerModel.confirmPassword ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(widget.onBackPage ?? GoToSplashPage());
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
                        GestureDetector(
                            onTap: () {
                              context
                                  .bloc<PageBloc>()
                                  .add(widget.onBackPage ?? GoToSplashPage());
                            },
                            child: SvgPicture.asset(
                                "assets/icons/back_arrow.svg")),
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
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                          ),
                          onChanged: (value) {
                            setState(() {
                              emailValid =
                                  EmailValidator.validate(value.trim());
                            });
                          },
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        TextField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: "Password",
                          ),
                          onChanged: (value) {
                            if (value.trim().length > 6) {
                              setState(() {
                                passwordValid = true;
                              });
                            } else {
                              setState(() {
                                passwordValid = false;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        TextField(
                          obscureText: true,
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
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
                    onTap: (emailValid &&
                            passwordValid &&
                            _confirmPasswordController.text ==
                                _passwordController.text)
                        ? () async {
                            widget.registerModel.email = _emailController.text.trim();
                            widget.registerModel.password =
                                _passwordController.text.trim();
                            widget.registerModel.confirmPassword =
                                _passwordController.text.trim();
                            context.bloc<PageBloc>().add(
                                GoToCompletingSignUpPage(
                                    widget.onBackPage, widget.registerModel));
                          }
                        : () {},
                    child: Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                          color: (emailValid &&
                                  passwordValid &&
                                  _confirmPasswordController.text ==
                                      _passwordController.text)
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
