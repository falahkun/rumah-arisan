part of 'pages.dart';

class NotifPage extends StatefulWidget {
  @override
  _NotifPageState createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  int currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final userToken = Provider.of<String>(context);

    context.bloc<UNBloc>().add(FetchUN(userToken));
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        // write code for your back button event here
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TopBar(
                onTap: () {
                  Navigator.pop(context);

                  /// write your back button event here
                },
                title: "Notifications",
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        _pageController.animateToPage(0,
                            duration: Duration(
                              milliseconds: 500,
                            ),
                            curve: Curves.easeInOut);
                      },
                      child: Text("Updates",
                          style: (currentIndex == 0)
                              ? regular.copyWith(fontSize: 18)
                              : regular.copyWith(
                                  fontSize: 14, color: Colors.grey)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        _pageController.animateToPage(1,
                            duration: Duration(
                              milliseconds: 500,
                            ),
                            curve: Curves.easeInOut);
                      },
                      child: Text("Transactions",
                          style: (currentIndex == 1)
                              ? regular.copyWith(fontSize: 18)
                              : regular.copyWith(
                                  fontSize: 14, color: Colors.grey)),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  // physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    ////  update fragment
                    BlocBuilder<UNBloc, UNState>(builder: (context, state) {
                      // return Container(color: Colors.blue);
                      return (state is OnLoadedUN)
                          ? ListView(
                              children: state.notif.data
                                  .map((e) => NotifItem(
                                        date:
                                            "${e.tanggal.hour}:${e.tanggal.minute}",
                                        description: e.deskripsi,
                                        image: e.icon,
                                        readed: e.dibaca,
                                        title: e.judul,
                                      ))
                                  .toList(),
                            )
                          : Center(child: CircularProgressIndicator());
                    }),

                    ////  transaction fragment
                    Container(color: Colors.red),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
