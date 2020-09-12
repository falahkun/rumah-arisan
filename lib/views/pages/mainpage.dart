part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int indexPage;

  const MainPage({Key key, this.indexPage = 0}) : super(key: key);
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentPage = 0;
  PageController _pageController;

  @override
  initState() {
    super.initState();
    setState(() {
      currentPage = widget.indexPage;
    });
    _pageController = PageController(initialPage: currentPage, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {

        if (authState is OnLoadedToken) {
        context.bloc<CloterBloc>().add(LoadCloter(authState.tokenResult.data.token));
        context.bloc<SliderBloc>().add(LoadSlider(authState.tokenResult.data.token));
        context.bloc<CommunitiesBloc>().add(LoadCommunities(authState.tokenResult.data.token));
        context.bloc<CategoryBloc>().add(LoadCategory());
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
                  HomeFragment(
                    tokenResult: authState.tokenResult,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  CategoryFragment(),
                  Container(
                    color: Colors.brown,
                  ),
                  AccountFragment(
                    tokenResult: authState.tokenResult,
                  )
                ],
              ),
              if (MediaQuery.of(context).viewInsets.bottom == 0)
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  selectedLabelStyle: bold.copyWith(fontSize: 11),
                  unselectedLabelStyle: regular.copyWith(fontSize: 11),
                  elevation: 15,
                  iconSize: 22,
                  items: [
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          "assets/icons/Light/Home.svg",
                          height: 22,
                          width: 22,
                          color: Colors.grey,
                        ),
                        activeIcon: SvgPicture.asset(
                          "assets/icons/Bold/Home.svg",
                          height: 22,
                          width: 22,
                        ),
                        title: Text("Home")),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          "assets/icons/Light/Activity.svg",
                          height: 22,
                          width: 22,
                          color: Colors.grey,
                        ),
                        activeIcon: SvgPicture.asset(
                          "assets/icons/Bold/Activity.svg",
                          height: 22,
                          width: 22,
                        ),
                        title: Text("Feeds")),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          "assets/icons/Light/Category.svg",
                          height: 22,
                          width: 22,
                          color: Colors.grey,
                        ),
                        activeIcon: SvgPicture.asset(
                          "assets/icons/Bold/Category.svg",
                          height: 22,
                          width: 22,
                        ),
                        title: Text("Categories")),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          "assets/icons/Light/Bag.svg",
                          height: 22,
                          width: 22,
                          color: Colors.grey,
                        ),
                        activeIcon: SvgPicture.asset(
                          "assets/icons/Bold/Bag.svg",
                          height: 22,
                          width: 22,
                        ),
                        title: Text("Cart")),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          "assets/icons/Light/Profile.svg",
                          height: 22,
                          width: 22,
                          color: Colors.grey,
                        ),
                        activeIcon: SvgPicture.asset(
                          "assets/icons/Bold/Profile.svg",
                          height: 22,
                          width: 22,
                        ),
                        title: Text("Account")),
                  ],
                  type: BottomNavigationBarType.fixed,
                  onTap: (index) {
                    currentPage = index;
                    _pageController.jumpToPage(currentPage);
                    setState(() {});
                  },
                  currentIndex: currentPage,
                ),
              ),
            ],
          );
        } else if (authState is OnUnauthorizedToken) {
          context.bloc<AuthBloc>().add(SignOut());
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
