part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentPage = 0;
  PageController _pageController;

  @override
  initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    context.bloc<SliderBloc>().add(LoadSlider(null));
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
        if (authState is OnLoadedToken) {
          return Stack(
            children: [
              PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: [
                  HomePage(tokenResult: authState.tokenResult,),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.brown,
                  ),
                  Container(
                    child: Center(child: FlatButton(onPressed: () async {
                      await AuthServices.removeSession();
                    }, child: Text("Logout")),),
                    color: Colors.green,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, -4))
                  ]),
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (currentPage == 0)
                        SvgPicture.asset("assets/icons/Home_active.svg")
                      else
                        GestureDetector(
                            onTap: () {
                              _pageController.jumpToPage(
                                0,
                              );
                            },
                            child:
                                SvgPicture.asset("assets/icons/Home_non.svg")),
                      if (currentPage == 1)
                        SvgPicture.asset("assets/icons/Activity_active.svg")
                      else
                        GestureDetector(
                            onTap: () {
                              _pageController.jumpToPage(
                                1,
                              );
                            },
                            child: SvgPicture.asset(
                                "assets/icons/Activity_non.svg")),
                      if (currentPage == 2)
                        SvgPicture.asset("assets/icons/Category_active.svg")
                      else
                        GestureDetector(
                            onTap: () {
                              _pageController.jumpToPage(
                                2,
                              );
                            },
                            child: SvgPicture.asset(
                                "assets/icons/Category_non.svg")),
                      if (currentPage == 3)
                        SvgPicture.asset("assets/icons/Notification_active.svg")
                      else
                        GestureDetector(
                            onTap: () {
                              _pageController.jumpToPage(
                                3,
                              );
                            },
                            child: SvgPicture.asset(
                                "assets/icons/Notification_non.svg")),
                      if (currentPage == 4)
                        SvgPicture.asset("assets/icons/Profile_active.svg")
                      else
                        GestureDetector(
                            onTap: () {
                              _pageController.jumpToPage(
                                4,
                              );
                            },
                            child: SvgPicture.asset(
                                "assets/icons/Profile_non.svg")),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (authState is OnUnauthorizedToken) {
          context.bloc<AuthBloc>().add(SignOut());

          ///in update adding param for a error message will show on popup in splashpage
          context.bloc<PageBloc>().add(GoToSplashPage());
          return Container();
        } else if (authState is OnError) {
          return Center(
            child: Text("message : ${authState.message}"),
          );
        }
        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}
