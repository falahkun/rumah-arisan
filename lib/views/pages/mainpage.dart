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
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
              Container(
                color: Colors.amber,
              ),
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
                color: Colors.green,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 4, offset: Offset(0, -4))
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
                        child: SvgPicture.asset("assets/icons/Home_non.svg")),
                  if (currentPage == 1)
                    SvgPicture.asset("assets/icons/Activity_active.svg")
                  else
                    GestureDetector(
                        onTap: () {
                          _pageController.jumpToPage(
                            1,
                          );
                        },
                        child:
                            SvgPicture.asset("assets/icons/Activity_non.svg")),
                  if (currentPage == 2)
                    SvgPicture.asset("assets/icons/Category_active.svg")
                  else
                    GestureDetector(
                        onTap: () {
                          _pageController.jumpToPage(
                            2,
                          );
                        },
                        child:
                            SvgPicture.asset("assets/icons/Category_non.svg")),
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
                        child:
                            SvgPicture.asset("assets/icons/Profile_non.svg")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
