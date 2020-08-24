part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isReach = false;
  var splashItem = [
    SplashItem(
      title: "Mewujudkan \nImpian",
      body:
          "Lewat aplikasi Rumah Arisan, \nbersama-sama wujudkan impian disetiap\ntahap kehidupanmu",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png",
    ),
    SplashItem(
      title: "Dapatkan",
      body:
          "Berbagai barang dan layanan yang membantu\npenuhi kebutuhanmu dan komunitasmu \ndengan harga terjangkau.",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png",
    ),
    SplashItem(
      title: "#DirumahTerus\nProduktif",
      body:
          "Berbagai barang dan layanan yang membantu\npenuhi kebutuhanmu dan komunitasmu \ndengan harga terjangkau.",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                itemCount: splashItem.length,
                reverse: isReach,
                onPageChanged: (index) {
                  if (index == splashItem.length) {
                    setState(() {
                      isReach = true;
                    });
                  } else {
                    setState(() {
                      isReach = false;
                    });
                  }
                },
                controller: PageController(keepPage: true, initialPage: 0),
                itemBuilder: (_, index) => splashItem[index]),
            Positioned(
              bottom: 50,
              right: 0,
              left: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.bloc<PageBloc>().add(GoToSignInPage());
                    },
                    child: Container(
                      height: 45,
                      width: 290,
                      decoration: BoxDecoration(
                        color: Color(0xFFC8000E),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: regular.copyWith(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Start Fresh Now?",
                        style:
                            regular.copyWith(fontSize: 14, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToSignUpPage(
                              GoToSplashPage(), RegisterModel()));
                        },
                        child: Text(
                          "Sign Up",
                          style:
                              bold.copyWith(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
