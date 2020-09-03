part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool emailValid = false;
  bool passwordValid = false;
  bool isTasking = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSplashPage());
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
                              context.bloc<PageBloc>().add(GoToSplashPage());
                            },
                            child: SvgPicture.asset(
                                "assets/icons/back_arrow.svg")),
                        SizedBox(
                          height: 27,
                        ),
                        Text("Hi,\nWelcome Back",
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
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Forgot Password ? ",
                              style: regular.copyWith(
                                  fontSize: 12, color: Colors.black),
                            ),
                            Text("Get Now",
                                style: bold.copyWith(
                                    fontSize: 12, color: Colors.black)),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),

                        /// ini adalah bloc kode untuk menambahkan metode sign in menggunakan social media
                        // Row(
                        //   children: [
                        //     IconButton(
                        //       padding: const EdgeInsets.only(right: 20),
                        //       icon: Icon(MdiIcons.googlePlus),
                        //       onPressed: () async {},
                        //     ),
                        //     IconButton(
                        //       padding: const EdgeInsets.only(right: 20),
                        //       icon: Icon(MdiIcons.facebook),
                        //       onPressed: () {},
                        //     )
                        //   ],
                        // )
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
                    onTap: (emailValid && passwordValid)
                        ? () async {
                            setState(() {
                              isTasking = true;
                            });
                            AuthResult _authResult = await AuthServices.signIn(
                                _emailController.text.trim(),
                                _passwordController.text.trim());

                            if (!_authResult.status) {
                              isTasking = false;
                              Flushbar(
                                message: _authResult.message,
                                animationDuration: Duration(milliseconds: 500),
                                duration: Duration(seconds: 2),
                                backgroundColor: Color(0xFFFF1267),
                                flushbarPosition: FlushbarPosition.TOP,
                              ).show(context);
                            } else {
                              isTasking = false;
                            }

                            setState(() {});
                          }
                        : () {},
                    child: Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                          color: (emailValid && passwordValid)
                              ? Color(0xFF1BA0E2)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(6)),
                      child: (isTasking)
                          ? CupertinoActivityIndicator()
                          : Icon(
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
                      "Start Fresh Now ? ",
                      style:
                          regular.copyWith(fontSize: 12, color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.bloc<PageBloc>().add(
                            GoToSignUpPage(GoToSignInPage(), RegisterModel()));
                      },
                      child: Text("Sign Up",
                          style:
                              bold.copyWith(fontSize: 12, color: Colors.black)),
                    )
                  ]),
                )
            ],
          ),
        ),
      ),
    );
  }
}
